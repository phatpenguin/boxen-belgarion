require 'spec_helper'

describe 'xpdf' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser'
    }
  end

  it do
    should include_class('homebrew')

    should contain_homebrew__formula('xpdf').
      with_before('Package[boxen/brews/xpdf]')

    should contain_package('boxen/brews/xpdf').with({
      :ensure => '3.03-boxen1'
    })
  end
end
