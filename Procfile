web bin/rails server -p $PORT -e $RAILS_ENV
worker: QUEUE=* bundle exec rake resque:work
scheduler: bundle exec rake resque:scheduler