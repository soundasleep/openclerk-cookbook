name             'openclerk'
maintainer       'Jevon Wright'
maintainer_email 'jevon@jevon.org'
license          'All rights reserved'
description      'Installs/Configures openclerk'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends "apache2"
depends "mysql", '~> 8.0'
depends "php"
depends "database"
depends "composer"
depends "nodejs"
depends "grunt_cookbook"
depends "chef_bundler"
