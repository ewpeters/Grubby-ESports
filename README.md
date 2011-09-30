FollowGrubby
========

Here is how you install stuff on the server extraplote what you need for your local set up
----------------------------
sudo apt-get install build-essential zlib1g-dev libssl-dev libreadline5-dev
sudo apt-get install git-core
sudo apt-get install libpcre3-dev
sudo apt-get install ruby
sudo apt-get install ruby1.8-dev
sudo apt-get install imagemagick libmagickwand-dev
wget http://rubyforge.org/frs/download.php/74343/rubygems-1.5.3.tgz
tar -xvf rubygems-1.5.3.tgz
cd rubygems-1.5.3
ruby setup.rb
sudo mv /usr/bin/gem1.8 /usr/bin/gem
cd ~/
wget http://nginx.org/download/nginx-1.0.6.tar.gz
tar -xvf nginx-1.0.6.tar.gz
cd nginx-1.0.6

./configure   --prefix=/usr/local/nginx \
              --with-sha1=/usr/lib \
              --with-sha1-asm \
              --with-http_ssl_module \
              --with-http_gzip_static_module \
              --user=nginx \
              --group=www-data \
              --conf-path=/etc/nginx/nginx.conf \
              --http-log-path=/var/log/nginx/access_log \
              --error-log-path=/var/log/nginx/error_log \
              --pid-path=/var/run/nginx.pid \
              --http-client-body-temp-path=/var/tmp/nginx/client \
              --http-proxy-temp-path=/var/tmp/nginx/proxy \
              --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi \
              --with-http_realip_module \
              --with-http_stub_status_module

make
sudo make install

sudo useradd --system --no-create-home --group www-data nginx

// Setup conf files and init scripts

sudo gem install unicorn
sudo gem install rails -v=2.3.8

sudo apt-get install mysql-server mysql-client libmysqlclient-dev

// root password: hUd5Rrx9pgBQQ1ypi2H5gP3f3pR768
sudo gem install mysql -v=2.8.1
sudo gem install rmagick -v=2.13.1

sudo mkdir /web_apps
sudo chown nginx:www-data /web_apps
sudo chmod -R 775 /web_apps && cd /web_apps
// download code
sudo git clone https://ewpeters@github.com/ewpeters/Grubby-ESports.git

sudo mv /web_apps/Grubby-ESports /web_apps/GESports

sudo rake gems:install

sudo rake db:create
sudo rake db:migrate

sudo /etc/init.d/unicorn start
sudo /etc/init.d/nginx start








