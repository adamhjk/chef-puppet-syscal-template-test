# Class: ocean
#
# This module manages ocean
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class ocean {
  file { "/tmp/distant.snakes":
    mode => 0644,
    ensure => present,
    content => template("distant.snakes.erb"),
    owner => adam,
    group => staff
  }
}
