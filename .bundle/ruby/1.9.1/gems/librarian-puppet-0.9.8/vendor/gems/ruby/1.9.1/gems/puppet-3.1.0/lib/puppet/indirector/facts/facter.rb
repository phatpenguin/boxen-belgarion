require 'puppet/node/facts'
require 'puppet/indirector/code'

class Puppet::Node::Facts::Facter < Puppet::Indirector::Code
  desc "Retrieve facts from Facter.  This provides a somewhat abstract interface
    between Puppet and Facter.  It's only `somewhat` abstract because it always
    returns the local host's facts, regardless of what you attempt to find."

  def self.reload_facter
    Facter.clear
    Facter.loadfacts
  end

  def self.load_fact_plugins
    # Add any per-module fact directories to the factpath
    module_fact_dirs = Puppet[:modulepath].split(File::PATH_SEPARATOR).collect do |d|
      ["lib", "plugins"].map do |subdirectory|
        Dir.glob("#{d}/*/#{subdirectory}/facter")
      end
    end.flatten
    dirs = module_fact_dirs + Puppet[:factpath].split(File::PATH_SEPARATOR)
    x = dirs.uniq.each do |dir|
      load_facts_in_dir(dir)
    end
  end

  def self.load_facts_in_dir(dir)
    return unless FileTest.directory?(dir)

    Dir.chdir(dir) do
      Dir.glob("*.rb").each do |file|
        fqfile = ::File.join(dir, file)
        begin
          Puppet.info "Loading facts in #{fqfile}"
          ::Timeout::timeout(Puppet[:configtimeout]) do
            load file
          end
        rescue SystemExit,NoMemoryError
          raise
        rescue Exception => detail
          Puppet.warning "Could not load fact file #{fqfile}: #{detail}"
        end
      end
    end
  end

  def destroy(facts)
    raise Puppet::DevError, "You cannot destroy facts in the code store; it is only used for getting facts from Facter"
  end

  # Look a host's facts up in Facter.
  def find(request)
    self.class.reload_facter
    self.class.load_fact_plugins
    result = Puppet::Node::Facts.new(request.key, Facter.to_hash)

    result.add_local_facts
    result.stringify

    result
  end

  def save(facts)
    raise Puppet::DevError, "You cannot save facts to the code store; it is only used for getting facts from Facter"
  end
end
