# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{faraday_middleware}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Erik Michaels-Ober", "Wynn Netherland"]
  s.date = %q{2012-10-26}
  s.description = %q{Various middleware for Faraday}
  s.email = ["sferik@gmail.com", "wynn.netherland@gmail.com"]
  s.files = [".gemtest", ".gitignore", ".rspec", ".travis.yml", "CHANGELOG.md", "Gemfile", "LICENSE.md", "README.md", "Rakefile", "faraday_middleware.gemspec", "lib/faraday_middleware.rb", "lib/faraday_middleware/addressable_patch.rb", "lib/faraday_middleware/backwards_compatibility.rb", "lib/faraday_middleware/instrumentation.rb", "lib/faraday_middleware/rack_compatible.rb", "lib/faraday_middleware/request/encode_json.rb", "lib/faraday_middleware/request/method_override.rb", "lib/faraday_middleware/request/oauth.rb", "lib/faraday_middleware/request/oauth2.rb", "lib/faraday_middleware/response/caching.rb", "lib/faraday_middleware/response/chunked.rb", "lib/faraday_middleware/response/follow_redirects.rb", "lib/faraday_middleware/response/mashify.rb", "lib/faraday_middleware/response/parse_dates.rb", "lib/faraday_middleware/response/parse_json.rb", "lib/faraday_middleware/response/parse_marshal.rb", "lib/faraday_middleware/response/parse_xml.rb", "lib/faraday_middleware/response/parse_yaml.rb", "lib/faraday_middleware/response/rashify.rb", "lib/faraday_middleware/response_middleware.rb", "lib/faraday_middleware/version.rb", "spec/caching_test.rb", "spec/chunked_spec.rb", "spec/encode_json_spec.rb", "spec/follow_redirects_spec.rb", "spec/helper.rb", "spec/mashify_spec.rb", "spec/method_override_spec.rb", "spec/oauth2_spec.rb", "spec/oauth_spec.rb", "spec/parse_dates_spec.rb", "spec/parse_json_spec.rb", "spec/parse_marshal_spec.rb", "spec/parse_xml_spec.rb", "spec/parse_yaml_spec.rb", "spec/rashify_spec.rb"]
  s.homepage = %q{https://github.com/pengwynn/faraday_middleware}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Various middleware for Faraday}
  s.test_files = ["spec/caching_test.rb", "spec/chunked_spec.rb", "spec/encode_json_spec.rb", "spec/follow_redirects_spec.rb", "spec/helper.rb", "spec/mashify_spec.rb", "spec/method_override_spec.rb", "spec/oauth2_spec.rb", "spec/oauth_spec.rb", "spec/parse_dates_spec.rb", "spec/parse_json_spec.rb", "spec/parse_marshal_spec.rb", "spec/parse_xml_spec.rb", "spec/parse_yaml_spec.rb", "spec/rashify_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, [">= 0.7.4", "< 0.9"])
      s.add_development_dependency(%q<multi_xml>, ["~> 0.2"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<hashie>, ["~> 1.2"])
      s.add_development_dependency(%q<rash>, ["~> 0.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<simple_oauth>, ["~> 0.1"])
      s.add_development_dependency(%q<rack-cache>, ["~> 1.1"])
    else
      s.add_dependency(%q<faraday>, [">= 0.7.4", "< 0.9"])
      s.add_dependency(%q<multi_xml>, ["~> 0.2"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<hashie>, ["~> 1.2"])
      s.add_dependency(%q<rash>, ["~> 0.3"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<simple_oauth>, ["~> 0.1"])
      s.add_dependency(%q<rack-cache>, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<faraday>, [">= 0.7.4", "< 0.9"])
    s.add_dependency(%q<multi_xml>, ["~> 0.2"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<hashie>, ["~> 1.2"])
    s.add_dependency(%q<rash>, ["~> 0.3"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<simple_oauth>, ["~> 0.1"])
    s.add_dependency(%q<rack-cache>, ["~> 1.1"])
  end
end
