set :application, "xbridge"
set :deploy_to, "/var/www/#{application}"
set :repository,  "git@github.com:stevecreedon/xbridge.git"
set :user, 'xbridge'

set :scm, :git
set :use_sudo, false
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "178.79.137.214"                          # Your HTTP server, Apache/etc
role :app, "178.79.137.214"                          # This may be the same as your `Web` server
role :db,  "178.79.137.214", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end