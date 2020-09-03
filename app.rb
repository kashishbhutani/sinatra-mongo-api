# setting up app environment
ENV['APP_ENV'] = 'development'

# sinatra app
require 'sinatra'

# route namespacing
require "sinatra/namespace"

# orm for models
require 'mongoid'

# debugger for development & test
require 'pry'

# database configurations
Mongoid.load! "./config/mongoid.config"

# serializers
require './serializers/init'

# helpers
require './helpers/init'

# models
require './models/init'

# routes
require './routes/init'