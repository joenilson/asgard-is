Asgard Information System :: Devel branch
=========================================

Introduction
------------
This is a system based on:

- Zend Framework 2.2.0 (PHP 5.4.x)
- ExtJS 4.2.0 GPL
- TinyMCE Editor
- Users Extensions from ExtJS Forums
- PostgreSQL 9.1
- Apache Web Server
- Zend Server 6.0 (for devel purporses)

Installation
------------


VirtualHost Creation
--------------------

First we need to config a virtual host to point to the app in this way:

sudo touch /etc/apache2/sites-enabled/devapp

sudo nano /etc/apache2/sites-enabled/devapp

	<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        ServerName dev.localhost
        DocumentRoot /path/to/your/appfolder/public
        <Directory />
        Options FollowSymLinks
        AllowOverride All
        </Directory>
        <Directory /path/to/your/appfolder/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/access.log combined
	</VirtualHost>

After this

sudo service apache2 restart

and test if http://dev.localhost/ load your app (with errors but load)

Hostname Validation
-------------------

In your /etc/hosts file you need to point the dev.localhost or whatever that you set pointing to your local ip


	127.0.0.1	localhost
	127.0.0.1	dev.localhost

There is how your /etc/hosts file must to be


DB Creation
-----------

Later we need to create a database, the initial database name is psamment

In postgresql trought the postgres user:

	createuser -EP yourdbuser

set a password for the user


later:

    createdb -U yourdbuser -W psamment 

and in the dbscripts folder yo will found the psamment.dmp file

    $ cd dbscripts
    psql -U yourdbuser -W psamment < psamment_structure.sql

It will fill the database with the schemas and tables and initial data.

at this point your app is running!.




