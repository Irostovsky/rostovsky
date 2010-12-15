set :application, "rostovsky"

set :scm, :git

set :repository,  "git@github.com:Irostovsky/rostovsky.git"

set :deploy_via, :copy
set :copy_strategy, :export

set :deploy_to, "/var/www/apps/rostovsky"
set :deploy_by_user, 'root@'

# set :use_sudo, true

set :ip, '173.203.201.62'
role :app, "#{deploy_by_user}#{ip}"
role :web, "#{deploy_by_user}#{ip}"
role :db,  "#{deploy_by_user}#{ip}", :primary => true

after 'deploy:symlink', 'deploy:shared_data', 'deploy:install_gems'

namespace :deploy do

  task :shared_data do
    shared_avatars_dir = "#{shared_path}/assets"
    run "mkdir -p #{shared_avatars_dir}" # make dir if it doesn't exist
    run "chown  -R www-data #{shared_avatars_dir}"
    run "ln -s #{shared_avatars_dir} #{current_path}/public/assets"
    
    run "ln -s '#{shared_path}/s3.yml' '#{current_path}/config/s3.yml'"
  end

  task :install_gems do
    run "cd #{release_path} && /var/lib/gems/1.8/bin/rake gems:install"
  end

  task :restart, :roles => :app do
    run "chown  -R www-data #{current_path}/"
    run "touch #{current_path}/tmp/restart.txt"
  end
end

