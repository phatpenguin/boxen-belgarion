# Public: Install Google Earth to /Applications.
#
# Examples
#
#   include googleearth
#
class googleearth {
  package { 'GoogleEarth':
    provider => 'appdmg',
    source   => 'http://dl.google.com/earth/client/advanced/current/GoogleEarthMac-Intel.dmg',
  }
}
