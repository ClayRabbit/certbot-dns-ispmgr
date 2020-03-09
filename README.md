# certbot-dns-ispmgr4
ISPmanager4 API for certbot --manual-auth-hook --manual-cleanup-hook

Install and renew Let's encrypt wildcard ssl certificate for domain *.site.com using ISPmanager API:

#### 1) Clone this repo and set the API key
```bash
git clone https://github.com/ClayRabbit/certbot-dns-ispmgr4 && cd ./certbot-dns-ispmgr4 && chmod +x *.sh
```

#### 2) Set API KEY

Set your user name, password and host from ISPmanager:

```bash
nano ./config.sh
```

#### 3) Install CertBot
```bash
...
```

#### 4) Generate wildcard
```bash
./certbot certonly --agree-tos --manual-public-ip-logging-ok --manual-auth-hook ../certbot-dns-ispmgr4/authenticator.sh --manual-cleanup-hook ../certbot-dns-ispmgr/cleanup.sh --preferred-challenges dns-01 -d 'site.com,*.site.com'
```

#### 5) Force Renew
```bash
./certbot renew --force-renew
```
