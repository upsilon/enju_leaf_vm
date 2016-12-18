listen 3000
worker_processes 2
timeout 30
preload_app true

after_fork do |server, worker|
  ActiveRecord::Base.clear_active_connections!
end
