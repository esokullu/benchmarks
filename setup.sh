#####################################
## Instructions for Wordpress
## https://www.tecmint.com/install-wordpress-on-ubuntu-16-04-with-lamp/
#####################################
sudo apt-get install apache2 apache2-utils
sudo systemctl enable apache2
sudo systemctl start apache2
sudo apt-get install mysql-client mysql-server
# password: 12345678
sudo mysql_secure_installation
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install php7.1 php7.1-mysql libapache2-mod-php7.1 php7.1-cli php7.1-cgi php7.1-gd
wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo rsync -av wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
mysql -u root -p
# CREATE DATABASE wp_myblog; GRANT ALL PRIVILEGES ON wp_myblog.* TO 'root'@'localhost' IDENTIFIED BY '12345678';
# FLUSH PRIVILEGES;
# exit;
cd  /var/www/html/
sudo mv wp-config-sample.php wp-config.php
sudo vi wp-config.php
sudo systemctl restart apache2.service
sudo systemctl restart mysql.service
sudo rm index.html

#####################################
## Instructions for Pho
## phonetworks.com
#####################################

# https://datawookie.netlify.com/blog/2016/09/installing-neo4j-on-ubuntu-16.04/
sudo apt install default-jre default-jre-headless
wget --no-check-certificate -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt update
sudo apt install neo4j
sudo service neo4j restart

# Pho
sudo apt install composer  redis-server
sudo apt install php7.1-dom  php7.1-mbstring  php7.1-zip  php7.1-bcmath
cd ~
git clone https://github.com/phonetworks/pho-server-rest/
cd pho-server-rest/
git submodule init &&  git submodule update
cd kernel
composer install
cd ..
composer install
