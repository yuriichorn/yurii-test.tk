set :application, 'yurii-test.tk'
set :ssh_options, {
    keys: %w(/home/sprut/.ssh/yurii-test_key.pem),
    forward_agent: false,
    auth_methods: %w(publickey)
}

set :repo_url, 'git@github.com:yuriichorn/yurii-test.tk.git'
set :deploy_to, '/home/www/yurii-test.tk'

#append :linked_files, "config/database.yml", "config/secrets.yml"
#append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "service thin restart"
    end
  end
