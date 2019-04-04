# Docs: https://docs.chef.io/config_rb_metadata.html
name             'fio-joe4dev'
description      'Installs and configures the fio CWB benchmark'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'cwb', '~> 0.1.3'
depends 'build-essential', '~> 8.2.1'
