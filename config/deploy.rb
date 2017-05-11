set :application, 'yurii-test.tk'
set :ssh_options, {
    keys: %w(/home/sprut/.ssh/yurii-test_key.pem),
    forward_agent: false,
    auth_methods: %w(publickey)
}
set :repo_url, 'git@github.com:yuriichorn/yurii-test.tk.git'
set :deploy_to, '/home/www/yurii-test.tk'

set(:ci_client){ "circle" }
set(:ci_repository){ "yuriichorn/yurii-test.tk.git" }
set(:ci_access_token){ "5f473a4379dcdda0005bc100ee6f1674af2cda64" }
 

namespace :deploy do
  task :cleanup do
    on roles(:app) do
        execute "cd /home/www/#{fetch(:application)}/current && bundle install"
        execute "service thin restart && service nginx reload"
    end
  end
end
