set :application, "192.168.0.97"
set :repository, "git://github.com/alexsoares/semana_educacao.git"
set :user, "informatica"
set :use_sudo, false
set :deploy_to, "/home/#{user}/semana.educacao"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server application, :app, :web, :db, :primary => true

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

   task :custom_symlinks do
     run "rm -rf #{release_path}/config/database.yml"
     run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
     run "ln -s #{shared_path}/503.html #{release_path}/public/503.html"
     run "mkdir #{shared_path}/cupons"
     run "ln -s #{shared_path}/cupons #{release_path}/public/cupons"
     run "cd #{deploy_to}/current && /usr/bin/env rake db:migrate RAILS_ENV=production"
   end
 end
