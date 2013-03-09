# Public: Install Watts.app to /Applications.
#
# Examples
#
#   include watts
class watts {
  package { 'Watts':
    provider => 'appdmg',
    source   => "http://www.matchingbrackets.com/abatt/customer/Watts-48.dmg",
  }
}
