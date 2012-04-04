# Redis::Connection::Universal

This is an experiment in creating a Redis connection that is
capable of using multiple transports to connect to multiple Redis
servers.  It will determine the transport type based on the URL
schema.

The connection driver is currently capable of connecting to both
standard redis instances (redis://) as well as ssl secured ones
(redis+ssl://).

This gem currently relies on a forked version of the redis gem
(https://github.com/gorsuch/redis-rb/tree/expand-connection-context),
which currently has a pull request open against the upstream tree
(https://github.com/redis/redis-rb/pull/191).

## Installation

Add these lines to your application's Gemfile:

    gem 'gorsuch-redis'
    gem 'redis-connection-universal'

And then execute:

    $ bundle

Or install it yourself as:
    $ gem install gorsuch-redis
    $ gem install redis-connection-universal

## Usage

Taking advantage of this driver is very simple - just require it.

```ruby
require 'redis'
require 'redis-connection-universal'

r = Redis.new url: "redis+ssl://myhost:6380"
r.keys
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
