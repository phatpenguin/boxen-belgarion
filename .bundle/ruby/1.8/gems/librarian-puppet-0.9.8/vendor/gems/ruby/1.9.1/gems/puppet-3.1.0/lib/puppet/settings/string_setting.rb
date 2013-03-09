# The base element type.
require 'puppet/settings/base_setting'

class Puppet::Settings::StringSetting < Puppet::Settings::BaseSetting
  def type
    :string
  end

  def validate(value)
    value.nil? or value.is_a?(String)
  end
end
