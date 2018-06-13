name             'fileedit'
maintainer       'Chef Example'
maintainer_email 'pwelch@chef.io'
license          'All Rights Reserved'
description      'Example PoC for editing files'
long_description 'Example PoC for editing files not fully managed by Chef'
version          '0.1.0'
chef_version '>= 13.1' if respond_to?(:chef_version)

supports 'ubuntu', '>= 14.04'

depends 'line', '= 2.0.0'

