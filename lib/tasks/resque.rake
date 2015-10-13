require 'resque/tasks'
task 'resque:setup' => :environment
require 'resque/scheduler/tasks'