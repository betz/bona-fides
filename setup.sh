USER=$(whoami)


# Download and install GCC for Mac without Xcode, if it doesn't exist already
command -v gcc >/dev/null 2>&1 || {
  echo "Downloading GCC for Mac, without Xcode."
  test "$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://cloud.github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg)" != '200' && (echo "Error, something went wrong"; exit 0)
  if [ "$?" == '0' ]; then
    echo "Cannot find GCC for Mac, file not found."
    exit 0
  fi
  curl -O http://cloud.github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg
  echo "Installing GCC for Mac."
  sudo installer -pkg GCC-*.pkg -target /
}


# Download and install git, if it doesnt exist already
command -v git >/dev/null 2>&1 || {
  echo "Installing Git."
  curl -O http://git-osx-installer.googlecode.com/files/git-1.7.9.4-intel-universal-snow-leopard.dmg
  hdiutil attach git*.dmg
  sudo installer -pkg '/Volumes/Git 1.7.9.4 Snow Leopard Intel Universal/git-1.7.9.4-intel-universal-snow-leopard.pkg' -target /
  hdiutil detach /Volumes/Git*
}


# Install homebrew if it doesnt exist already
command -v brew >/dev/null 2>&1 || {
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
  brew doctor
  brew update
}


# Install PHP 5.4.0
echo "Installing PHP 5.4.0"
curl -s http://php-osx.liip.ch/install.sh | bash -s 5.4
echo "Creating symlink for PHP CLI"
sudo rm /usr/bin/php
sudo ln -s /usr/local/php5/bin/php /usr/bin/php

# Aditional notes on this PHP installation: See http://php-osx.liip.ch/
#
# Included extensions
# bcmath bz2 calendar Core ctype curl date dom ereg exif fileinfo filter ftp gd gettext hash iconv imap intl json ldap libxml mbstring mcrypt memcache memcached mhash mongo mssql mysql mysqli mysqlnd OAuth odbc openssl pcntl pcre PDO pdo_dblib pdo_mysql pdo_pgsql pdo_sqlite pgsql Phar posix Reflection session shmop SimpleXML soap sockets solr SPL SQLite sqlite3 standard sysvmsg sysvsem sysvshm tidy tokenizer uploadprogress wddx xdebug xhprof xml xmlreader xmlrpc xmlwriter xsl zip zlib Xdebug
# available but disabled by default: apc, xslcache
#
# php.ini
# The php.ini is located in /usr/local/php5/lib/php.ini, additional config files are located in /usr/local/php5/php.d/. The php.ini is based on php.ini-development
#
# apc and xslcache
# apc and xslcache need to be enabled manually in /usr/local/php5/php.d/50-extension-apc.ini and /usr/local/php5/php.d/50-extension-xslcache.ini.
#
# xdebug
# xdebug settings needs to be configured (idekey etc) manually in /usr/local/php5/php.d/50-extension-xdebug.ini.


# Install Pear
command -v pear >/dev/null 2>&1 || {
  echo "Installing Pear"
  curl http://pear.php.net/go-pear.phar > go-pear.phar
  php -d detect_unicode=0 go-pear.phar
  mv /Users/$USER/pear/bin/pear /usr/local/bin/
}


# Install Drush
command -v drush >/dev/null 2>&1 || {
  echo "Installing Drush"
  pear channel-discover pear.drush.org
  pear install drush/drush
}


# Install MySQL5
command -v pear >/dev/null 2>&1 || {
  echo "Installing MySQL5"
  curl -O http://mysql.easynet.be/Downloads/MySQL-5.5/mysql-5.5.23-osx10.6-x86_64.dmg
  hdiutil attach mysql-5.5.23-osx10.6-x86_64.dmg
  sudo installer -pkg '/Volumes/mysql-5.5.23-osx10.6-x86_64/mysql-5.5.23-osx10.6-x86_64.pkg' -target /
  hdiutil detach /Volumes/mysql*
}




