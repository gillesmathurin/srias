# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#
require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/rails'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

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
