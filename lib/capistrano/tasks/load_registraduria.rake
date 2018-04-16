namespace :registraduria do
  desc 'Find all missing records in registraduria'
  task :find do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: "#{fetch(:stage)}" do
          execute :rake, "registraduria:find"
        end
      end
    end
  end
end
