# -*- encoding : utf-8 -*-

#############################################################
# Load additional libs
#############################################################
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require "bundler/capistrano"

#############################################################
#   Servers
#############################################################
set :user, "root"
# set :password, 'passenger'
set :domain, "208.88.125.46"
set :server_hostname, '208.88.125.46'

role :web, server_hostname                          # Your HTTP server, Apache/etc
role :app, server_hostname                          # This may be the same as your `Web` server
role :db,  server_hostname, :primary => true        # This is where Rails migrations will run

#############################################################
#   Application
#############################################################
set :application, "srias"
set :deploy_to, "/var/rails/srias2"

#############################################################
#   Git
#############################################################
set :git_account, 'gillesmathurin'
set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :repository, "git@github.com:#{git_account}/#{application}.git"
set :branch, 'rails326'
set :rails_env, "production"

#############################################################
#   Settings
#############################################################
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
# set :deploy_via, :remote_cache
# set :git_shallow_clone, 1
# set :git_enable_submodules, 1

#############################################################
# Setup RVM support
#############################################################
set :rvm_path, '/usr/local/rvm'
set :rvm_bin_path, "/usr/local/rvm/bin" 
set :rvm_ruby_string, '1.9.2-p320@srias'        # Or whatever env you want it to run in.
set :rvm_type, :default

namespace :delayed_job do
  def rails_env
    fetch(:rails_env, false) ? "RAILS_ENV=#{fetch(:rails_env)}" : ''
  end
  
  desc "Stop the delayed_job process"
  task :stop, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production script/delayed_job stop"
  end

  desc "Start the delayed_job process"
  task :start, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production script/delayed_job start"
  end

  desc "Restart the delayed_job process"
  task :restart, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production script/delayed_job restart"
  end
end

namespace :deploy do  
  task :start do ; end
  task :stop do ; end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  task :finishing_touches, :roles => :app do
    run "cp -pf /var/rails/srias2/to_copy/database.yml #{current_path}/config/database.yml"
    # run "cp -pf /var/rails/srias/to_copy/mail.rb #{current_path}/config/initializers/mail.rb"
  end

  task :precompile do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
  
  task :set_database_yml_file, :roles => :app do
      text = <<-EOS
production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: srias2_production
  pool: 5
  username: root
  password: g1i9l7l7ou
EOS

    config = ERB.new(text)
    put config.result(binding), "/var/rails/srias2/to_copy/database.yml"
  end

  task :create_database, :roles => :app do
    # run "cd #{release_path}; RAILS_ENV=production bundle exec rake db:create"
  end

  task :set_to_wwwdata_user, :roles => :app do
    run "chown -R www-data:root /var/rails/srias2"
    # run "chown -R www-data:root #{current_path}/log/production.log"
  end
  
  task :load_seeds_data, :role => :app do
    # run "cd #{current_path} && rake db:seed RAILS_ENV=production"
  end

  desc "build missing paperclip styles"
  task :build_missing_paperclip_styles, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake paperclip:refresh:missing_styles"
  end
end
 
after 'deploy:create_symlink', 'deploy:set_database_yml_file', 'deploy:finishing_touches', 'deploy:precompile','deploy:set_to_wwwdata_user'#, 'deploy:create_database', deploy:build_missing_paperclip_styles