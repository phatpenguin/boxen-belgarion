# Public: Install xpdf via homebrew
#
# Examples
#
#   include xpdf
class xpdf {
  include homebrew

  homebrew::formula { 'xpdf':
    before => Package['boxen/brews/xpdf'],
  }

  package { 'boxen/brews/xpdf':
    ensure => '3.03-boxen1'
  }
}
