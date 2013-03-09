require 'spec_helper'

describe 'vlc' do
  it do
    should contain_package('VLC').with({
      :provider => 'appdmg',
      :source   => 'http://sourceforge.net/projects/vlc/files/2.0.4/macosx/vlc-2.0.4.dmg',
    })
  end
end
