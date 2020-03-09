# certbot-dns-ispmgr
ISPmanager API for certbot --manual-auth-hook --manual-cleanup-hook

Install and renew Let's encrypt wildcard ssl certificate for domain *.site.com using ISPmanager API:

#### 1) Clone this repo and set the API key
```bash
git clone https://github.com/bsidev/certbot-dns-ispmgr && cd ./certbot-dns-ispmgr && chmod +x *.sh
```

#### 2) Set API KEY

Set your user name, password and host from ISPmanager:

```bash
nano ./config.sh
```

#### 3) Install CertBot from git
```bash
cd ../ && git clone https://github.com/certbot/certbot && cd certbot
```

#### 4) Generate wildcard
```bash
./certbot certonly --agree-tos --manual-public-ip-logging-ok --manual-auth-hook ../certbot-dns-ispmgr4/authenticator.sh --manual-cleanup-hook ../certbot-dns-ispmgr/cleanup.sh --preferred-challenges dns-01 -d 'site.com,*.site.com'
```

#### 5) Force Renew
```bash
./letsencrypt-auto renew --force-renew --manual --manual-auth-hook ../certbot-dns-ispmgr/authenticator.sh --manual-cleanup-hook ../certbot-dns-ispmgr/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```
