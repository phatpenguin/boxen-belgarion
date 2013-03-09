require 'spec_helper'

describe 'GoogleEarth' do
  it do
    should contain_package('GoogleEarth').with({
      :provider => 'appdmg',
      :source   => 'http://dl.google.com/earth/client/advanced/current/GoogleEarthMac-Intel.dmg',
    })
  end
end
