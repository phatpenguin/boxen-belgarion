# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.0"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.1.0"
github "nodejs",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "3.1.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Required for my chosen modules
github "osx",	   "1.0.0"
github "autoconf", "1.0.0"
github "libtool",  "1.0.0"
github "boxen",  "1.2.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "firefox",  "1.0.1", :repo => "boxen/puppet-firefox"
github "textmate", "1.1.0", :repo => "AquaGeek/puppet-textmate2"
github "vim", "1.0.1", :repo => "JHaals/puppet-vim"
github "python", "1.1.1", :repo => "boxen/puppet-python"
github "chrome", "1.1.0", :repo => "boxen/puppet-chrome"
github "skype", "1.0.1", :repo => "boxen/puppet-skype"
github "transmission", "1.0.0", :repo => "fromonesrc/puppet-transmission"
github "sublime_text_2", "1.1.0", :repo => "boxen/puppet-sublime_text_2"
github "java", "1.0.6", :repo => "boxen/puppet-java"
github "clojure", "1.2.0", :repo => "boxen/puppet-clojure"
github "alfred", "1.0.1", :repo => "boxen/puppet-alfred"
github "gitx", "1.1.0", :repo => "boxen/puppet-gitx"
github "dropbox", "1.0.0", :repo => "boxen/puppet-dropbox"
github "googleearth", "1.0.0", :repo => "mattheath/puppet-googleearth"
github "zsh", "1.0.0", :repo => "boxen/puppet-zsh"
github "xquartz", "1.0.0", :repo => "boxen/puppet-xquartz"
github "xpdf", "1.0.0", :repo => "boxen/puppet-xpdf"
github "wget", "1.0.0", :repo => "boxen/puppet-wget"
github "watts", "1.0.0", :repo => "boxen/puppet-watts"
github "vlc", "1.0.0", :repo => "boxen/puppet-vlc"
github "spotify", "1.0.0", :repo => "boxen/puppet-spotify"
github "solr", "1.0.0", :repo => "boxen/puppet-solr"
github "phantomjs", "1.0.0", :repo => "boxen/puppet-phantomjs"
github "pcre", "1.0.0", :repo => "boxen/puppet-pcre"
github "minecraft", "1.0.0", :repo => "boxen/puppet-minecraft"
github "pkgconfig", "1.0.0", :repo => "boxen/puppet-pkgconfig"
github "handbrake", "1.0.0", :repo => "boxen/puppet-handbrake"
github "gcc", "1.0.0", :repo => "boxen/puppet-gcc"
github "erlang", "1.0.0", :repo => "boxen/puppet-erlang"
github "emacs", "1.0.0", :repo => "boxen/puppet-emacs"
github "redis", "1.0.0", :repo => "boxen/puppet-redis"
