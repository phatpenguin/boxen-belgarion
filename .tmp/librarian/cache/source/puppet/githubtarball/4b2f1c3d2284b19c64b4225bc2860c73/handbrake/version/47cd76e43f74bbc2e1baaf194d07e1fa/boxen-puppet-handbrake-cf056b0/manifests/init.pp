# Public: Install Handbrake.app to /Applications.
#
# Examples
#
#   include handbrake
class handbrake {
  $version = '0.9.8'

  package { 'HandBrake':
    provider => 'appdmg',
    source   => "http://sourceforge.net/projects/handbrake/files/${version}/HandBrake-${version}-MacOSX.6_GUI_x86_64.dmg",
  }
}
