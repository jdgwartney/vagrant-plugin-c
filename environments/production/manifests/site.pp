# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

file { 'bash_profile':
  path    => '/home/vagrant/.bash_profile',
  ensure  => file,
  content => file('bash/bash_profile'),
}

package { 'pkg-config':
  ensure => 'latest',
}
package { 'libgsl0-dev':
  ensure => 'latest',
}
package { 'git':
  ensure => 'latest',
}
package { 'libjson-glib-dev':
  ensure => 'latest',
}
package { 'automake':
  ensure => 'latest',
}
package { 'python-pip':
  ensure => 'latest',
}
package { 'python-pygments':
  ensure => 'latest',
}
package { 'python-dateutil':
  ensure => 'latest',
}
package { 'python-jinja2':
  ensure => 'latest',
}
package { 'python-requests':
  ensure => 'latest',
}

class { 'boundary':
    token => $api_token,
}

