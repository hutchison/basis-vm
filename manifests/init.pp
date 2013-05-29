exec { 'apt update':
    command => '/usr/bin/apt-get update',
}

package { 'httpd':
    name => 'apache2',
    ensure => present,
}

package { ['postgresql', 'git', 'vim', 'nmap']:
    ensure => present,
}

service { 'postgresql':
    ensure => running,
    enable => true,
    require => Package['postgresql'],
}

package { ['postgresql-server-dev-all', 'python-dev']:
    ensure => present,
}

package { ['python-virtualenv']:
    ensure => present,
}

Exec['apt update'] -> Package <| |>
