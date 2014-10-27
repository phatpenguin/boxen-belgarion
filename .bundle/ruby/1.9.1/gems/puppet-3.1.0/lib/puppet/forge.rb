require 'net/http'
require 'open-uri'
require 'pathname'
require 'uri'
require 'puppet/forge/cache'
require 'puppet/forge/repository'
require 'puppet/forge/errors'

class Puppet::Forge
  # +consumer_name+ is a name to be used for identifying the consumer of the
  # forge and +consumer_semver+ is a SemVer object to identify the version of
  # the consumer
  def initialize(consumer_name, consumer_semver)
    @consumer_name = consumer_name
    @consumer_semver = consumer_semver
  end

  # Return a list of module metadata hashes that match the search query.
  # This return value is used by the module_tool face install search,
  # and displayed to on the console.
  #
  # Example return value:
  #
  # [
  #   {
  #     "author"      => "puppetlabs",
  #     "name"        => "bacula",
  #     "tag_list"    => ["backup", "bacula"],
  #     "releases"    => [{"version"=>"0.0.1"}, {"version"=>"0.0.2"}],
  #     "full_name"   => "puppetlabs/bacula",
  #     "version"     => "0.0.2",
  #     "project_url" => "http://github.com/puppetlabs/puppetlabs-bacula",
  #     "desc"        => "bacula"
  #   }
  # ]
  #
  def search(term)
    server = Puppet.settings[:module_repository]
    Puppet.notice "Searching #{server} ..."
    response = repository.make_http_request("/modules.json?q=#{URI.escape(term)}")

    case response.code
    when "200"
      matches = PSON.parse(response.body)
    else
      raise RuntimeError, "Could not execute search (HTTP #{response.code})"
    end

    matches
  end

  def remote_dependency_info(author, mod_name, version)
    version_string = version ? "&version=#{version}" : ''
    response = repository.make_http_request("/api/v1/releases.json?module=#{author}/#{mod_name}#{version_string}")
    json = PSON.parse(response.body) rescue {}
    case response.code
    when "200"
      return json
    else
      error = json['error'] || ''
      if error =~ /^Module #{author}\/#{mod_name} has no release/
        return []
      else
        raise RuntimeError, "Could not find release information for this module (#{author}/#{mod_name}) (HTTP #{response.code})"
      end
    end
  end

  def get_release_packages_from_repository(install_list)
    install_list.map do |release|
      modname, version, file = release
      cache_path = nil
      if file
        begin
          cache_path = repository.retrieve(file)
        rescue OpenURI::HTTPError => e
          raise RuntimeError, "Could not download module: #{e.message}"
        end
      else
        raise RuntimeError, "Malformed response from module repository."
      end
      cache_path
    end
  end

  # Locate a module release package on the local filesystem and move it
  # into the `Puppet.settings[:module_working_dir]`. Do not unpack it, just
  # return the location of the package on disk.
  def get_release_package_from_filesystem(filename)
    if File.exist?(File.expand_path(filename))
      repository = Repository.new('file:///')
      uri = URI.parse("file://#{URI.escape(File.expand_path(filename))}")
      cache_path = repository.retrieve(uri)
    else
      raise ArgumentError, "File does not exists: #{filename}"
    end

    cache_path
  end

  def retrieve(release)
    repository.retrieve(release)
  end

  def uri
    repository.uri
  end

  def repository
    version = "#{@consumer_name}/#{[@consumer_semver.major, @consumer_semver.minor, @consumer_semver.tiny].join('.')}#{@consumer_semver.special}"
    @repository ||= Puppet::Forge::Repository.new(Puppet[:module_repository], version)
  end
  private :repository
end
