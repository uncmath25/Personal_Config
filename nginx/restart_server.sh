sudo rm -rf /etc/nginx/sites-enabled/default
sudo cp /home/USER/websites/nginx.conf /etc/nginx/sites-enabled/default
sudo chown root:root /etc/nginx/sites-enabled/default

sudo nginx -t
sudo service nginx restart

echo "Restarting Nginx Server..."

sudo service mysql restart

echo "Restarting MySQL Database..."
