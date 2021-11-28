
/usr/bin/certbot certonly -d "*.koehler.family" -d "*.streem.tech" -d koehler.family -d streem.tech --dns-cloudflare-credentials /etc/nginx/cloudflare.ini --force-renewal --preferred-challenges=dns-01 -n --dns-cloudflare && /usr/sbin/service nginx reload
