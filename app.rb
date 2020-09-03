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
Mongoid.load! "mongoid.config"

# models
require './models/init'
