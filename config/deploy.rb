set :application, "twittodo"
set :scm, :git
set :repository,  "git@github.com:nmeans/twitdo.git"
set :deploy_to, "/var/www/apps/twitdo"
set :use_sudo, :true

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