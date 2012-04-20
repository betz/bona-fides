Bona Fides
==========

Mac webdevelopment setup script.
This is my personal OSX Lion initialisation script, setting up many used tools.
As i didn't find many scripts, and most people use Mamp or Webstart, i decided to build my own and share it.
If you have suggestions, please create an issue on Github.

What does Bona Fides install?
=============================
- CGG 10.7-v2 (without using XCode)
- Git 1.7.9.4
- Homebrew
- Apache
- PHP 5.4.0
- Pear
- MYSQL

Only when a version is listed, i specifically chose that version. 
Others versions may change.

PHP extensions
==============
apc
bcmath 
bz2 
calendar 
Core 
ctype 
curl 
date 
dom 
ereg 
exif 
fileinfo 
filter 
ftp gd 
gettext 
hash iconv 
imap 
intl 
json 
ldap 
libxml 
mbstring 
mcrypt 
memcache 
memcached 
mhash 
mongo 
mssql 
mysql 
mysqli 
mysqlnd 
OAuth 
odbc 
openssl 
pcntl 
pcre 
PDO 
pdo_dblib 
pdo_mysql 
pdo_pgsql 
pdo_sqlite 
pgsql 
Phar 
posix 
Reflection 
session 
shmop 
SimpleXML 
soap 
sockets 
solr 
SPL 
SQLite 
sqlite3 
standard 
sysvmsg 
sysvsem 
sysvshm 
tidy 
tokenizer 
uploadprogress 
wddx 
xdebug 
xhprof 
xml 
xmlreader 
xmlrpc 
xmlwriter 
xsl 
zip 
zlib 
Xdebug
xslcache

available but disabled by default: apc, xslcache

How to?
=======

- On a fresh mac install, install git, See at following link to download the DMG. http://code.google.com/p/git-osx-installer/downloads/list
- Open terminal.app
- Clone the Github repo with following command: (just copy and paste in terminal and hit enter)
 
  git clone https://betz@github.com/betz/bona-fides.git

- When done, enter the folder you just created with cloning the repo. Do this with following command:
 
  cd bona-fides

- Make the setup.sh file executable with next command:

  chmod +x setup.sh

- Start the setup:

  ./setup.sh


When asked for your password, enter your mac user password and hit enter.
It is normal that you dont see your cursor moving when typing a password.
Follow instructions as you see them. (it will ask to hit enter few times)

Credits
=======
For the PHP part, i am using the version of http://php-osx.liip.ch
Bona Fides is maintained by Tom Behets (betz)

