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

get '/sign_up' do

  erb :signup
end

post '/sign_up' do
  user = User.new
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.birthdate = params[:birthdate]
  user.email = params[:email]
  user.password = params[:password]
  user.save

  redirect '/'
end