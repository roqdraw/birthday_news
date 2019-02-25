require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'db_config'
require_relative 'models/bookmark'
require_relative 'models/user'

enable :sessions

get '/' do
  erb :index
end


get '/session/new'

erb :login
end