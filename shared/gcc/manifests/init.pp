# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {
  include homebrew

  homebrew::formula { 'apple-gcc42':
    before => Package['boxen/brews/apple-gcc42'],
  }

  package { 'boxen/brews/apple-gcc42':
    ensure => '4.2.1-5666.3-boxen1'
  }
}
