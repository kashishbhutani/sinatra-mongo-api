# All application routes will be initialized here.
require_relative './users'
require_relative './posts'

#GET / | Home
get '/' do
    'Welcome To Sinatra !'
end