require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque-scheduler'

    # Resque.schedule = YAML.load_file('schedule.yml')
    # require 'jobs'

  end
end

