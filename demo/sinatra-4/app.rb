require 'sinatra'
require 'sinatra/reloader'
# require './song'

get '/' do
  @title = "home"
  erb(:home)
end

get '/about' do
  #@name = :view
  @title = "about"
  erb :about
end

get '/contact' do
  @title = "contact"
  erb :contact
end

get '/students' do
  @title = "Students"
  erb :students
end

get '/comments' do
  @title = "Comments"
  erb :comments
end

get '/videos' do
  @title = "Videos"
  erb :videos
end

not_found do
  erb :notfound, :layout=>false
end