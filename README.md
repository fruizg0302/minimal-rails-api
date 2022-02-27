# README

## TL;DR 
  - Work in Progress
  - Rails for JSON API Backend
    - Does not include, several middlewares
    - Includes a Dockerfile if you want to test it quickly
    - Opinionated according to my point of view, feel free to fork it and change it as you wish

## Minimal Only API Rails Template

This runs with:

* Ruby 3.1.1
* Rails 7.0.2.2
* Passenger 6.0.12 as server
* PG Gem

As the intention of this is to provide a performant Rails Application from the start
I've removed the following middlewares:

```
  #We are not serving files from this application
  config.middleware.delete Rack::Sendfile
  
  #We are sending only JWTs for Auth
  config.middleware.delete ActionDispatch::Cookies
  config.middleware.delete ActionDispatch::Session::CookieStore
  
  #We are not rendering HTML from this service
  config.middleware.delete Rack::MethodOverride
  
  #Telemetry usually uses other marker to determine runtime response
  config.middleware.delete Rack::Runtime
```

Of course is the necessity arises you can re - add the at any time.


## Run with Docker with:

`docker-compose run web db:create`
`docker-compose up`

