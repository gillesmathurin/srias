set :stage, :production
set :deploy_to, "/home/deployer/srias"
set :keep_releases, 3

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{deployer@104.236.44.70}
role :web, %w{deployer@104.236.44.70}
role :db,  %w{deployer@104.236.44.70}

# RVM Syntax
# ==========
set :rvm_ruby_version, '2.3.1@srias'

# RAILS Asset Pipeline
# ====================
set :assets_roles, [:web, :app] 
set :normalize_asset_timestamps, %{public/assets}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'copy database.yml to proper location'
  # task :copy_database_yml do
  #   on roles(:app) do |host|
  #     puts "#{release_path}"
  #     execute "cp -pf /var/rails/srias2/to_copy/database.yml #{release_path}/config/database.yml"
  #   end
  # end

  desc 'create system symlink'
  task :create_symlinks do
    on roles(:app) do
      execute "ln -nfs /home/deployer/srias/shared/system #{release_path}/public/system"
    end
  end

  desc "Change App directories Permissions"
   task :set_to_wwwdata_user do
    on roles(:app) do
      execute "chown -R www-data:root /var/rails/srias2"
    end
  end


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  # after :updating, 'deploy:copy_database_yml'
  after :updating, 'deploy:create_symlinks'
  after :finishing, 'deploy:cleanup'
  # after :finishing, 'deploy:set_to_wwwdata_user'
end


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)
