# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hiera}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Puppet Labs"]
  s.date = %q{2012-08-30}
  s.default_executable = %q{hiera}
  s.description = %q{A pluggable data store for hierarcical data}
  s.email = %q{info@puppetlabs.com}
  s.executables = ["hiera"]
  s.files = ["bin/hiera", "lib/hiera/backend/yaml_backend.rb", "lib/hiera/backend.rb", "lib/hiera/config.rb", "lib/hiera/console_logger.rb", "lib/hiera/noop_logger.rb", "lib/hiera/puppet_logger.rb", "lib/hiera/util.rb", "lib/hiera.rb", "CHANGELOG", "COPYING", "README.md", "LICENSE", "spec/spec.opts", "spec/spec_helper.rb", "spec/unit/backend/yaml_backend_spec.rb", "spec/unit/backend_spec.rb", "spec/unit/config_spec.rb", "spec/unit/console_logger_spec.rb", "spec/unit/hiera_spec.rb", "spec/unit/util_spec.rb"]
  s.homepage = %q{https://github.com/puppetlabs/hiera}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Light weight hierarchical data store}
  s.test_files = ["spec/spec.opts", "spec/spec_helper.rb", "spec/unit/backend/yaml_backend_spec.rb", "spec/unit/backend_spec.rb", "spec/unit/config_spec.rb", "spec/unit/console_logger_spec.rb", "spec/unit/hiera_spec.rb", "spec/unit/util_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
