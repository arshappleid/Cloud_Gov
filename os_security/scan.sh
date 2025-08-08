#!/bin/bash

# ==============================
# Configurable Variables (with defaults)
# ==============================
CONNECTIONS=10
REQUESTS=50
OUT="scan_$(date +%Y%m%d_%H%M%S).txt"
FP_FILE="scan_fingerprints_$(date +%Y%m%d_%H%M%S).txt"

# Parse CLI parameters
while getopts "c:r:o:f:" opt; do
  case $opt in
    c) CONNECTIONS="$OPTARG" ;;  # -c number of connections
    r) REQUESTS="$OPTARG" ;;     # -r number of requests
    o) OUT="$OPTARG" ;;          # -o output file for scan results
    f) FP_FILE="$OPTARG" ;;      # -f fingerprint output file
    *) echo "Usage: $0 [-c connections] [-r requests] [-o outfile] [-f fpfile] [targets...]"
       exit 1 ;;
  esac
done
shift $((OPTIND -1))

# Prepare output files
: > "$OUT"
: > "$FP_FILE"


# ==============================
# Fingerprint Formatter
# ==============================
format_fp() {
  awk '
    /^==============NEXT SERVICE FINGERPRINT/ {
      if (inblock) { gsub("%"," ",buffer); sub(":", " ", buffer); print buffer; buffer="" }
      print; inblock=1; next
    }
    /^SF-/ || /^SF:/ {
      gsub(/\r/, "", $0)
      if (buffer == "") { buffer=$0 } else { buffer=buffer " " $0 }
      next
    }
    {
      if (inblock) {
        gsub("%"," ",buffer)
        sub(":", " ", buffer)
        print buffer
        buffer=""
        inblock=0
      }
      print
    }
    END {
      if (inblock && buffer != "") {
        gsub("%"," ",buffer)
        sub(":", " ", buffer)
        print buffer
      }
    }
  '
}

# ==============================
# Scanning Function
# ==============================
scan_target() {
  local host="$1"
  echo -e "\n===== TARGET: $host =====\n" | tee -a "$OUT"

  # DNS Lookup
  if ! [[ "$host" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "===== DNSLOOKUP ($host) =====" | tee -a "$OUT"
    dig +short A AAAA "$host" | tee -a "$OUT"
    echo | tee -a "$OUT"
  fi

  # Nmap port scan 1–1024
  echo "===== NMAP PORT SCAN (PORTS: 1-1024) -> $host =====" | tee -a "$OUT"
  OPEN_PORTS=$(nmap -Pn -p 1-1024 --open --reason "$host" 2>/dev/null | awk '/open/{print $1}' | cut -d/ -f1 | paste -sd, -)
  echo | tee -a "$OUT"

  # Nmap service detection
  if [ -n "$OPEN_PORTS" ]; then
    echo "===== NMAP SERVICE DETECTION (-sV) -> $host =====" | tee -a "$OUT"
    nmap -Pn -sV --version-all --reason --open -p "$OPEN_PORTS" "$host" 2>&1 | format_fp | tee -a "$OUT"
    echo | tee -a "$OUT"
  else
    echo "No open ports found on $host" | tee -a "$OUT"
  fi

  # WhatWeb
  echo "===== WHATWEB ($host) =====" | tee -a "$OUT"
  if command -v whatweb >/dev/null 2>&1; then
    whatweb "$host" | tee -a "$OUT"
  else
    echo "whatweb not installed." | tee -a "$OUT"
  fi
  echo | tee -a "$OUT"

  # Curl Headers
  echo "===== CURL HEADERS ($host) =====" | tee -a "$OUT"
  if [[ "$OPEN_PORTS" == *80* ]]; then
    echo "## http://" | tee -a "$OUT"
    curl -I --max-time 5 "http://$host" 2>/dev/null | tee -a "$OUT"
    echo | tee -a "$OUT"
  fi
  if [[ "$OPEN_PORTS" == *443* ]]; then
    echo "## https://" | tee -a "$OUT"
    curl -I --max-time 5 -k "https://$host" 2>/dev/null | tee -a "$OUT"
    echo | tee -a "$OUT"
  fi

  # Siege test
  echo "===== SIEGE TEST ($host) =====" | tee -a "$OUT"
  if command -v siege >/dev/null 2>&1; then
    siege -c "$CONNECTIONS" -r "$REQUESTS" "http://$host" 2>&1 | tee -a "$OUT"
  else
    echo "siege not installed." | tee -a "$OUT"
  fi
  echo | tee -a "$OUT"
}

# ==============================
# Main Execution
# ==============================
if [ $# -eq 0 ]; then
  echo "No target provided. Using default: scanme.nmap.org"
  TARGETS=("scanme.nmap.org")
else
  TARGETS=("$@")
fi

echo "Output file: $OUT"
for target in "${TARGETS[@]}"; do
  scan_target "$target"
done
