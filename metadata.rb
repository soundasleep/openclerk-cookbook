name             'openclerk'
maintainer       'Jevon Wright'
maintainer_email 'jevon@jevon.org'
license          'All rights reserved'
description      'Installs/Configures openclerk'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

depends "apache2"
depends "mysql", "5.3.6"
depends "php"
depends "database"

