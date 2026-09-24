# In this section we will learn how to enable HTTPS, using SSL certificates via Let's Encrypt.

We will use Certbot to obtain an SSL certificate from Let's Encrypt
SSH into server
```bash
ssh -i <identity-file.pem> <username>@<ip_address>
```

Install the Certbot client and its dedicated Nginx plugin using apt
```bash
sudo apt install certbot python3-certbot-nginx -y
```

Edit your domain name in nginx conf file
```bash
sudo nano /etc/nginx/sites-available/<your_project_name>
```

Find the server_name line, and Change the IP address to match your new root domain and www subdomain
```bash
server_name <your_domain>.com www.<your_domain>.com; 
```
Save, Exit and reload nginx
```bash
sudo nginx -t
sudo systemctl reload nginx
```

Obtain the certificate
```bash
sudo certbot --nginx -d <your_domain>.com -d www.<your_domain>.com
```

Automate the certificate renewal
```bash
sudo certbot renew --dry-run
```
or

We can use cron job to renew the SSL certificate
```bash
sudo crontab -e
0 0 * * 0 certbot renew --quiet
```

Create a post-renewal hook
```bash
sudo nano /etc/letsencrypt/renewal-hooks/post/reload-nginx.sh
```
Paste the below bash command inside
```bash
#!/bin/bash
systemctl reload nginx
```

Grant executable permission
```bash
sudo chmod +x /etc/letsencrypt/renewal-hooks/post/reload-nginx.sh
```