exec { 'apt update':
    command => '/usr/bin/apt-get update',
}

package { 'httpd':
    name => 'apache2',
    ensure => present,
}

package { 'postgresql':
    name => 'postgresql',
    ensure => present,
}

service { 'postgresql':
    ensure => 'running',
    enable => true,
    require => Package['postgresql'],
}

package { 'git':
    name => 'git',
    ensure => present,
}

package { 'vim':
    name => 'vim',
    ensure => present,
}

package { 'nmap':
    name => 'nmap',
    ensure => present,
}

Exec['apt update'] -> Package <| |>
