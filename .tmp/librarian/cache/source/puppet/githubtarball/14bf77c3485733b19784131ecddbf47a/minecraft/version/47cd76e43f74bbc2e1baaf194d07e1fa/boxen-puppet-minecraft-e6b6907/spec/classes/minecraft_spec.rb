require 'spec_helper'

describe 'minecraft' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end
  it do
    should contain_package('Minecraft').with({
      :source   => 'http://s3.amazonaws.com/MinecraftDownload/launcher/Minecraft.zip',
      :provider => 'compressed_app'
    })
  end
end
