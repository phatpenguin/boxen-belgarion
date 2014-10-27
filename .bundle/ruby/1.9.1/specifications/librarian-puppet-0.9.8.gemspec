# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "librarian-puppet"
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Sharpe"]
  s.date = "2013-02-13"
  s.description = "Simplify deployment of your Puppet infrastructure by\n  automatically pulling in modules from the forge and git repositories with\n  a single command."
  s.email = ["tim@sharpe.id.au"]
  s.executables = ["librarian-puppet"]
  s.files = ["bin/librarian-puppet"]
  s.homepage = "https://github.com/rodjek/librarian-puppet"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Bundler for your Puppet modules"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.15"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.15"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.15"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
  end
end
