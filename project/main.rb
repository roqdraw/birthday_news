require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pg'
require_relative 'db_config'
require_relative 'models/bookmark'
require_relative 'models/user'
require 'pry'
enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    if current_user 
      true
    else
      false
    end
  end
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

post '/session' do
  user = User.find_by(email: params["email"])
  if user && user.authenticate(params["password"])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

get '/log_in' do
  erb :login
end

post '/sign_up' do
  user = User.new
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.birth_year = params[:birth_year]
  user.birth_month = params[:birth_month]
  user.birth_day = params[:birth_day]
  user.email = params[:email]
  user.password = params[:password]
  user.save

  redirect '/'
end

get '/sign_up' do
  erb :signup
end

get '/signout' do 
session[:user_id] = nil
redirect '/'
end

get '/articles/:id' do
  @user = User.find_by(id: current_user.id)
  erb :articles_list
end

get '/user' do
  if logged_in?
    @pub_date = "#{current_user.birth_year}-#{current_user.birth_month}-#{current_user.birth_day}"
    erb :user_show
  end
end

put '/user' do
  user = User.find_by(id: current_user.id)
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.birth_year = params[:birth_year]
  user.birth_month = params[:birth_month]
  user.birth_day = params[:birth_day]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  redirect '/user'
end

get '/user/edit' do
  @user = User.find_by(id: current_user.id)
  erb :edit
end

get '/articles/bookmarks' do 
  erb :bookmark
end