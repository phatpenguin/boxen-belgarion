require 'spec_helper'

describe 'handbrake' do
  it do
    should contain_package('HandBrake').with({
      :provider => 'appdmg',
      :source   => 'http://sourceforge.net/projects/handbrake/files/0.9.8/HandBrake-0.9.8-MacOSX.6_GUI_x86_64.dmg',
    })
  end
end
