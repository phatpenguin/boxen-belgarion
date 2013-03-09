# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{boxen}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Barnette", "Will Farrington"]
  s.date = %q{2013-02-14}
  s.description = %q{Manage Mac development boxes with love (and Puppet).}
  s.email = ["jbarnette@github.com", "wfarr@github.com"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "LICENSE", "README.md", "boxen.gemspec", "lib/boxen/check.rb", "lib/boxen/checkout.rb", "lib/boxen/cli.rb", "lib/boxen/config.rb", "lib/boxen/error.rb", "lib/boxen/flags.rb", "lib/boxen/hook.rb", "lib/boxen/hook/github_issue.rb", "lib/boxen/hook/web.rb", "lib/boxen/keychain.rb", "lib/boxen/postflight.rb", "lib/boxen/postflight/active.rb", "lib/boxen/postflight/env.rb", "lib/boxen/preflight.rb", "lib/boxen/preflight/creds.rb", "lib/boxen/preflight/directories.rb", "lib/boxen/preflight/etc_my_cnf.rb", "lib/boxen/preflight/homebrew.rb", "lib/boxen/preflight/identity.rb", "lib/boxen/preflight/os.rb", "lib/boxen/preflight/rbenv.rb", "lib/boxen/preflight/rvm.rb", "lib/boxen/project.rb", "lib/boxen/puppeteer.rb", "lib/boxen/runner.rb", "lib/boxen/service.rb", "lib/boxen/util.rb", "lib/facter/boxen.rb", "lib/system_timer.rb", "script/Boxen", "script/bootstrap", "script/build-keychain-helper", "script/release", "script/tests", "src/keychain-helper.c", "test/boxen/test.rb", "test/boxen_check_test.rb", "test/boxen_checkout_test.rb", "test/boxen_cli_test.rb", "test/boxen_config_test.rb", "test/boxen_directories_test.rb", "test/boxen_flags_test.rb", "test/boxen_hook_github_issue_test.rb", "test/boxen_hook_web_test.rb", "test/boxen_keychain_test.rb", "test/boxen_postflight_active_test.rb", "test/boxen_postflight_env_test.rb", "test/boxen_preflight_etc_my_cnf_test.rb", "test/boxen_preflight_homebrew_test.rb", "test/boxen_preflight_rvm_test.rb", "test/boxen_project_test.rb", "test/boxen_puppeteer_test.rb", "test/boxen_runner_test.rb", "test/boxen_service_test.rb", "test/boxen_util_test.rb", "test/fixtures/repo/modules/projects/manifests/first-project.pp", "test/fixtures/repo/modules/projects/manifests/second-project.pp", "test/system_timer.rb"]
  s.homepage = %q{https://github.com/boxen/boxen}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{You know, for laptops and stuff.}
  s.test_files = ["test/boxen/test.rb", "test/boxen_check_test.rb", "test/boxen_checkout_test.rb", "test/boxen_cli_test.rb", "test/boxen_config_test.rb", "test/boxen_directories_test.rb", "test/boxen_flags_test.rb", "test/boxen_hook_github_issue_test.rb", "test/boxen_hook_web_test.rb", "test/boxen_keychain_test.rb", "test/boxen_postflight_active_test.rb", "test/boxen_postflight_env_test.rb", "test/boxen_preflight_etc_my_cnf_test.rb", "test/boxen_preflight_homebrew_test.rb", "test/boxen_preflight_rvm_test.rb", "test/boxen_project_test.rb", "test/boxen_puppeteer_test.rb", "test/boxen_runner_test.rb", "test/boxen_service_test.rb", "test/boxen_util_test.rb", "test/fixtures/repo/modules/projects/manifests/first-project.pp", "test/fixtures/repo/modules/projects/manifests/second-project.pp", "test/system_timer.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>, ["~> 1.4"])
      s.add_runtime_dependency(%q<hiera>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<highline>, ["~> 1.6"])
      s.add_runtime_dependency(%q<json_pure>, [">= 1.7.7", "< 2.0"])
      s.add_runtime_dependency(%q<librarian-puppet>, ["~> 0.9"])
      s.add_runtime_dependency(%q<octokit>, ["~> 1.15"])
      s.add_runtime_dependency(%q<puppet>, ["~> 3.0"])
      s.add_development_dependency(%q<minitest>, ["= 4.4.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.13"])
    else
      s.add_dependency(%q<ansi>, ["~> 1.4"])
      s.add_dependency(%q<hiera>, ["~> 1.0.0"])
      s.add_dependency(%q<highline>, ["~> 1.6"])
      s.add_dependency(%q<json_pure>, [">= 1.7.7", "< 2.0"])
      s.add_dependency(%q<librarian-puppet>, ["~> 0.9"])
      s.add_dependency(%q<octokit>, ["~> 1.15"])
      s.add_dependency(%q<puppet>, ["~> 3.0"])
      s.add_dependency(%q<minitest>, ["= 4.4.0"])
      s.add_dependency(%q<mocha>, ["~> 0.13"])
    end
  else
    s.add_dependency(%q<ansi>, ["~> 1.4"])
    s.add_dependency(%q<hiera>, ["~> 1.0.0"])
    s.add_dependency(%q<highline>, ["~> 1.6"])
    s.add_dependency(%q<json_pure>, [">= 1.7.7", "< 2.0"])
    s.add_dependency(%q<librarian-puppet>, ["~> 0.9"])
    s.add_dependency(%q<octokit>, ["~> 1.15"])
    s.add_dependency(%q<puppet>, ["~> 3.0"])
    s.add_dependency(%q<minitest>, ["= 4.4.0"])
    s.add_dependency(%q<mocha>, ["~> 0.13"])
  end
end
