# Find Your MP

[![Build Status](https://travis-ci.org/katylouise/find_your_mp.svg?branch=master)](https://travis-ci.org/katylouise/find_your_mp)

A simple Ruby on Rails app using the [data.parliament](http://www.data.parliament.uk/) API.  It enables a user to search for their MP using their postcode.  Data is cached using Redis.

## Getting Started
Firstly, make sure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/), [Rails](http://installrails.com/) and [Redis](http://redis.io/download) all installed.
Then, you run the following commands from the terminal.

```
git clone https://github.com/katylouise/find_your_mp
cd find_your_mp
bundle install
```

In a separate terminal tab or window, start the redis-server:
```
redis-server
```

To run the app,
```
rails s
```
then navigate to localhost:3000.

## Running tests

To run the tests, open two terminal tabs or windows. In the first enter,
```
redis-server
```

In the second, enter,
```
rake spec
```
