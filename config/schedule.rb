set :output, "/app/shared/log/cron.log"
every 1.day, at: '3:30 am', roles: [:app] do
  rake 'registraduria:find'
end
