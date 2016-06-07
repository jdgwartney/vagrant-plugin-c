# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

file { 'bash_profile':
  path    => '/home/vagrant/.bash_profile',
  ensure  => file,
  content => file('bash/bash_profile'),
}

git::config { 'user.email':
  value => 'john.doe@example.com',
}


package { 'pkg-config':
  ensure => 'latest',
}
package { 'libgsl0-dev':
  ensure => 'latest',
}
package { 'git-dev':
  ensure => 'latest',
}
package { 'libjson-glib-dev':
  ensure => 'latest',
}

class { 'boundary':
    token => $api_token,
}

