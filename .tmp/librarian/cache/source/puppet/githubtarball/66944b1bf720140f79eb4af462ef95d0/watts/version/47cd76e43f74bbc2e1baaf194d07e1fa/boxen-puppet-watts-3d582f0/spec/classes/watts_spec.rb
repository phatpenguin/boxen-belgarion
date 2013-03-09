require 'spec_helper'

describe 'watts' do
  it do
    should contain_package('Watts').with({
      :provider => 'appdmg',
      :source   => 'http://www.matchingbrackets.com/abatt/customer/Watts-48.dmg',
    })
  end
end
