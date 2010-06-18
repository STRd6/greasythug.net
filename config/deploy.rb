default_run_options[:pty] = true

set :application, "greasythug.net"

set :scm, :git
set :repository,  "git://github.com/STRd6/#{application}.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

ssh_options[:port] = 2112

role :app, "67.207.139.110"
role :web, "67.207.139.110"
role :db,  "67.207.139.110", :primary => true

task :after_setup do
  run "mkdir #{shared_path}/db"
  run "touch #{shared_path}/log/nginx.log"
  run "touch #{shared_path}/log/nginx.error.log"
end

after "deploy", "deploy:cleanup"

# Passenger start Tasks
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
