Important to note, to not use open ssl certificates in production. 

## Generating PKI key using open ssl 
Install Openssl for ubuntu 
```bash
sudo apt update
sudo apt install openssl
```
Install Openssl for RHEL 
```bash 
sudo dnf install openssl
```

Generating Key
```bash
cd /etc/nginx/
openssl req -x509 -days 100 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/self.key -out /etc/nginx/ssl/self.cert
```

## Changing Permission for security
#### Security Rationale
- Private key (.key):
	- 640 → Read/write for root, read for nginx group, no access for others. Protects the key from unauthorized reads.
- Public cert (.cert):
	- 644 → Readable by everyone (safe, it’s public data).


```bash
chown root:nginx /ssl /ssl/self.key /ssl/self.cert   # Owner=root, Group=nginx
chmod 750 /ssl									# ssl directory
chmod 640 /ssl/self.key                         # rw-r----- (private key)
chmod 644 /ssl/self.cert                        # rw-r--r-- (public cert)
```