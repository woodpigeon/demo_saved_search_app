
## Overvew

A sample app to prototype the use of [resque scheduler](https://github.com/resque/resque-scheduler)'s dynamic scheduling
to allow a user to specify search criteria and a recurring interval (for example every 2 weeks) after which search results are emailed to them.
The user can edit their saved searches (potentially removing them from resque-scheduler and readding them with the new interval), or delete them.
The appproach could equally be applied to something like user-scheduled webhooks.

I don't yet know how this scales, i.e how many 'saved searches' can be added as descrete schedules without performance or other limitations being hit.

_This is still a work in progress_

The sample app is deployed to heroku [here](https://demo-saved-search-app.herokuapp.com).

## Installation

You'll need to have Ruby 2.x.x, [redis](http://redis.io/topics/quickstart) and
[bundler](http://bundler.io/) installed ie ```gem install bundler```.

Set up the app:

```
$ git clone https://github.com/woodpigeon/demo_saved_search_app.git
$ cd demo_saved_search_app
$ bundle
$ bundle exec rake db:setup
```

Run the app in one terminal tab:

```
$ bundle exec spring rails
```

Run [resque](https://github.com/resque/resque) in another ternimal/tab:

```
$ QUEUE=* bundle exec spring rake resque:work
```

Run [resque scheduler](https://github.com/resque/resque-scheduler) in another terminal/tab:

```
$ bundle exec spring rake resque:scheduler
```

Open ```http://localhost:3000```.

## Tests

```
$ bundle exec rspec
```

or

```
$ bundle exec guard
```

for continuous testing.