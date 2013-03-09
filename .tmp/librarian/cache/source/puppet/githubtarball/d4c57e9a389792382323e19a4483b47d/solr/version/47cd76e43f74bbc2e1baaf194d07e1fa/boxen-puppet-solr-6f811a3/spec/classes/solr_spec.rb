require 'spec_helper'

describe 'solr' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'wfarr',
    }
  end

  it do
    should include_class('homebrew')
    should include_class('java')

    should contain_homebrew__formula('solr').with_before('Package[boxen/brews/solr]')

    should contain_package('boxen/brews/solr').with({
      :ensure  => '4.1.0-boxen1',
      #:require => 'Class[java]'
    })
  end
end
