require 'sinatra'
require 'sinatra/reloader'
require './song'

# edit ip bonded
set :bind, '0.0.0.0'

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

get '/*' do
  @route = params[:splat]
  pass
end

not_found do
  erb :notfound, :layout=>false
end

