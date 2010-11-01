# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# Load RVM's capistrano plugin.    
require "rvm/capistrano"
set :rvm_ruby_string, 'ree'
set :rvm_type, :user

set :application, "thelatejar"
set :repository, "git@github.com:sprout/thelatejar.git"

set :scm, "git" 
set :user, 'deploy'
set :runner, 'deploy'
set :branch, 'master'
set :use_sudo, false
set :ssh_options, {:forward_agent => true}
puts "*** Updating cached repository and copying over to new release"
set :scm_username, 'sprout-deploy'

set :deploy_to, "/home/deploy/#{application}"
set :keep_releases, 3
 
# keep a cached code checkout on the server, and do updates each time (more efficient)
set :deploy_via, :remote_cache
 
 
role :app, '173.230.156.177'
role :web, '173.230.156.177'
role :db,  '173.230.156.177', :primary => true


#####################################################################################
###                           BEFORE/AFTER COMMANDS                                ##
#####################################################################################

after :deploy, 'deploy:cleanup'

task :after_update_code, :except => { :no_release => true } do
  
end
#####################################################################################
###                         REMOTE UTILITY COMMANDS                                ##
#####################################################################################

##
## Phusion Passenger tasks
##

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

##
## Bundler tasks
##

namespace :bundler do  
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
    run("ln -s #{shared_path}/database.yml #{current_release}/config/database.yml")
  end
  
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test development console"
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'
after 'deploy:update_code', 'deploy:migrate'