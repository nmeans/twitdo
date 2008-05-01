set :application, "twittodo"
set :scm, :git
set :repository,  "git@github.com:nmeans/twitdo.git"
set :deploy_to, "/var/www/apps/twitdo"
set :use_sudo, :true
set :thin_conf, "/etc/thin/twitdo.yml"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "twitdo-deploy@twitdo.heliumsyndicate.com"
role :web, "twitdo-deploy@twitdo.heliumsyndicate.com"
role :db,  "twitdo-deploy@twitdo.heliumsyndicate.com", :primary => true

namespace :deploy do
  namespace :thin do
    [ :stop, :start, :restart ].each do |t|
      desc "#{t.to_s.capitalize} the thin cluster"
      task t, :roles => :app do
        invoke_command "thin #{t.to_s} -C #{thin_conf}", :via => :sudo
      end
    end
  end
  
  desc "Custom restart task for thin cluster"
  task :restart, :roles => :app, :except => { :no_release => true } do
    deploy.thin.restart
  end

  desc "Custom start task for thin cluster"
  task :start, :roles => :app do
    deploy.thin.start
  end

  desc "Custom stop task for thin cluster"
  task :stop, :roles => :app do
    deploy.thin.stop
  end
  
  desc "Restart the web server"
  task :restart_web, :roles => :web do
    invoke_command "/etc/init.d/nginx restart", :via => :sudo
  end

  desc "Stop the web server"
  task :stop_web, :roles => :web do
    run "/etc/init.d/nginx stop", :via => :sudo
  end

  desc "Start the web server"
  task :start_web, :roles => :web do
    run "/etc/init.d/nginx start", :via => :sudo
  end
end