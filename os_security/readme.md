
## Running Port Scan on domain/ip

#### Ensure necessary packages are installed
```
# Debian/Ubuntu
sudo apt update && sudo apt install nmap dnsutils whatweb siege curl -y


# RHEL/CentOS/Fedora
sudo dnf install nmap bind-utils whatweb siege curl -y

```

#### Usage 
```
./basic_port_scan.sh <target1> [target2] ...
## Example
./scan.sh example.com 192.168.0.15 anotherdomain.org
## Default Behaviour (Test) - will scan scanme.nmap.org
./scan.sh
```
#### Delete All Logs 
```
find ./ -type f -name "scan_*.txt" -delete
```
#### Summary of Commands in the Script

1. dig +short A AAAA <target>

  Performs DNS lookups for IPv4 (A) and IPv6 (AAAA) records to resolve the target’s IP addresses.

2. nmap -Pn -p 1-1024 --open --reason <target>

  - Scans the first 1024 TCP ports without host discovery (-Pn).

  - Shows only open ports (--open) and explains why they are considered open (--reason).

  - Purpose: Quickly identify open TCP ports in the well-known range.

3. nmap -Pn -sV --version-all --reason --open -p <open_ports> <target>

  - Performs service and version detection (-sV).

  - Uses all available probes for accuracy (--version-all).

  - Displays reasons for port states (--reason).

  - Lists only open ports (--open).

  - Purpose: Identify the exact services and versions running on the discovered ports.

4. whatweb <target>

  - Fingerprints web technologies (server type, frameworks, CMS, plugins) used by the target website.

5. curl -I <target> / curl -I -k https://<target>

  Fetches only HTTP headers (-I) to see:

  - HTTP version.

  - Response codes.

  - Security headers.

  - -k ignores certificate errors for HTTPS.

6. siege -c <connections> -r <requests> <target>
Performs load testing by making multiple concurrent connections (-c) and repeating requests (-r).
Useful for measuring server performance under stress.

#### Script Variables

```bash
# dcanRun with all defaults

./scan.sh scanme.nmap.org

# Custom connections & requests

./scan.sh -c 20 -r 100 scanme.nmap.org

# Custom output filenames

./scan.sh -c 15 -r 80 -o myscan.txt -f myfps.txt scanme.nmap.org 8.8.8.8

```



##### **`CONNECTIONS`**

- Number of concurrent connections `siege` will use during load testing.
- Higher values increase load on the target.
- **Example:** `CONNECTIONS=10` means 10 users hitting the server simultaneously.

------

##### **`REQUESTS`**

- Number of times each siege connection will repeat the request.
- **Example:** `REQUESTS=50` means each simulated user sends 50 requests.

------

##### **`OUT`**

- Output filename for the main scan results.
- Defaults to: `scan_<YYYYMMDD>_<HHMMSS>.txt` (timestamped).
- Changing it lets you save results to a specific file name or directory.

------

##### **`FP_FILE`**

- Output filename for separated Nmap service fingerprints (raw data).
- Also timestamped by default.
- Useful if you want to store unformatted fingerprint info separately.



### References 

- [Top Nmap 16 commands](https://www.recordedfuture.com/threat-intelligence-101/tools-and-techniques/nmap-commands)
- [NIST 800-115](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-115.pdf)



