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
  user.color = params[:color]
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

get '/articles/guest' do 
  @year = params[:year]
  @month = params[:month]
  @day = params[:day]
  p @year
  if(@year === nil || @year === "") 
    redirect '/'
    return
  end
  erb :articles_guest_list
end

get '/articles/bookmarks' do
  @bookmarks = Bookmark.where(user_id: current_user.id)
  @guests = Bookmark.all
  erb :bookmark
end

get '/api/articles/bookmarks/categories' do
  bookmarks = Bookmark.where(guest_name: params[:guest_name])
  binding.pry
  content_type "application/json"
  bookmarks.to_json
end

get '/api/articles/bookmarks' do
  guests = Bookmark.all
  content_type "application/json"
  guests.to_json
end

post '/articles/bookmarks' do
  bookmark = Bookmark.new
  bookmark.user_id = current_user.id
  bookmark.article_id = params[:article_id]
  bookmark.guest_name = params[:folder_name]
  bookmark.save

  redirect '/articles/bookmarks'
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
  user.color = params[:color]
  user.save
  redirect '/user'
end

get '/user/edit' do
  @user = User.find_by(id: current_user.id)
  erb :edit
end


