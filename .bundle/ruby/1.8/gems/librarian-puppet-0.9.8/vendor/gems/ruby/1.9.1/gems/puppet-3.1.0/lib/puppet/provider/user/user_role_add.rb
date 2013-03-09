require 'puppet/util'
require 'puppet/util/user_attr'

Puppet::Type.type(:user).provide :user_role_add, :parent => :useradd, :source => :useradd do

  desc "User and role management on Solaris, via `useradd` and `roleadd`."

  defaultfor :osfamily => :solaris

  commands :add => "useradd", :delete => "userdel", :modify => "usermod", :password => "passwd", :role_add => "roleadd", :role_delete => "roledel", :role_modify => "rolemod"
  options :home, :flag => "-d", :method => :dir
  options :comment, :method => :gecos
  options :groups, :flag => "-G"
  options :roles, :flag => "-R"
  options :auths, :flag => "-A"
  options :profiles, :flag => "-P"
  options :password_min_age, :flag => "-n"
  options :password_max_age, :flag => "-x"

  verify :gid, "GID must be an integer" do |value|
    value.is_a? Integer
  end

  verify :groups, "Groups must be comma-separated" do |value|
    value !~ /\s/
  end

  has_features :manages_homedir, :allows_duplicates, :manages_solaris_rbac, :manages_passwords, :manages_password_age

  #must override this to hand the keyvalue pairs
  def add_properties
    cmd = []
    Puppet::Type.type(:user).validproperties.each do |property|
      #skip the password because we can't create it with the solaris useradd
      next if [:ensure, :password, :password_min_age, :password_max_age].include?(property)
      # 1680 Now you can set the hashed passwords on solaris:lib/puppet/provider/user/user_role_add.rb
      # the value needs to be quoted, mostly because -c might
      # have spaces in it
      if value = @resource.should(property) and value != ""
        if property == :keys
          cmd += build_keys_cmd(value)
        else
          cmd << flag(property) << value
        end
      end
    end
    cmd
  end

  def user_attributes
    @user_attributes ||= UserAttr.get_attributes_by_name(@resource[:name])
  end

  def flush
    @user_attributes = nil
  end

  def command(cmd)
    cmd = ("role_#{cmd}").intern if is_role? or (!exists? and @resource[:ensure] == :role)
    super(cmd)
  end

  def is_role?
    user_attributes and user_attributes[:type] == "role"
  end

  def run(cmd, msg)
      execute(cmd)
  rescue Puppet::ExecutionFailure => detail
      raise Puppet::Error, "Could not #{msg} #{@resource.class.name} #{@resource.name}: #{detail}"
  end

  def transition(type)
    cmd = [command(:modify)]
    cmd << "-K" << "type=#{type}"
    cmd += add_properties
    cmd << @resource[:name]
  end

  def create
    if is_role?
      run(transition("normal"), "transition role to")
    else
      run(addcmd, "create")
      if cmd = passcmd
        run(cmd, "change password policy for")
      end
    end
    # added to handle case when password is specified
    self.password = @resource[:password] if @resource[:password]
  end

  def destroy
    run(deletecmd, "delete "+ (is_role? ? "role" : "user"))
  end

  def create_role
    if exists? and !is_role?
      run(transition("role"), "transition user to")
    else
      run(addcmd, "create role")
    end
  end

  def roles
    user_attributes[:roles] if user_attributes
  end

  def auths
    user_attributes[:auths] if user_attributes
  end

  def profiles
    user_attributes[:profiles] if user_attributes
  end

  def project
    user_attributes[:project] if user_attributes
  end

  def managed_attributes
    [:name, :type, :roles, :auths, :profiles, :project]
  end

  def remove_managed_attributes
    managed = managed_attributes
    user_attributes.select { |k,v| !managed.include?(k) }.inject({}) { |hash, array| hash[array[0]] = array[1]; hash }
  end

  def keys
    if user_attributes
      #we have to get rid of all the keys we are managing another way
      remove_managed_attributes
    end
  end

  def build_keys_cmd(keys_hash)
    cmd = []
    keys_hash.each do |k,v|
      cmd << "-K" << "#{k}=#{v}"
    end
    cmd
  end

  def keys=(keys_hash)
    run([command(:modify)] + build_keys_cmd(keys_hash) << @resource[:name], "modify attribute key pairs")
  end


  # This helper makes it possible to test this on stub data without having to
  # do too many crazy things!
  def target_file_path
    "/etc/shadow"
  end
  private :target_file_path

  #Read in /etc/shadow, find the line for this user (skipping comments, because who knows) and return it
  #No abstraction, all esoteric knowledge of file formats, yay
  def shadow_entry
    return @shadow_entry if defined? @shadow_entry
    @shadow_entry = File.readlines(target_file_path).
      reject { |r| r =~ /^[^\w]/ }.
      collect { |l| l.chomp.split(':') }.
      find { |user, _| user == @resource[:name] }
  end

  def password
    shadow_entry[1] if shadow_entry
  end

  def password_min_age
    shadow_entry ? shadow_entry[3] : :absent
  end

  def password_max_age
    return :absent unless shadow_entry
    shadow_entry[4] || -1
  end

  # Read in /etc/shadow, find the line for our used and rewrite it with the
  # new pw.  Smooth like 80 grit sandpaper.
  #
  # Now uses the `replace_file` mechanism to minimize the chance that we lose
  # data, but it is still terrible.  We still skip platform locking, so a
  # concurrent `vipw -s` session will have no idea we risk data loss.
  def password=(cryptopw)
    begin
      shadow = File.read(target_file_path)

      # Go Mifune loves the race here where we can lose data because
      # /etc/shadow changed between reading it and writing it.
      # --daniel 2012-02-05
      Puppet::Util.replace_file(target_file_path, 0640) do |fh|
        shadow.each_line do |line|
          line_arr = line.split(':')
          if line_arr[0] == @resource[:name]
            line_arr[1] = cryptopw
            line = line_arr.join(':')
          end
          fh.print line
        end
      end
    rescue => detail
      fail "Could not write replace #{target_file_path}: #{detail}"
    end
  end
end
