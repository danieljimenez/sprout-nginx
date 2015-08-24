name             'sprout-nginx'
maintainer       'Foreflight'
maintainer_email 'danielj@foreflight.com'
license          'MIT'
description      'Recipes to install and configure Nginx on OS X'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports         'mac_os_x'
depends          'homebrew', '>= 1.5.4'
depends          'sprout-base'