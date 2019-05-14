require 'sinatra'
require 'sinatra/reloader'

# edit ip bonded
set :bind, '0.0.0.0'

get '/hello' do
  "<h1> i got your request, this is my response</h1>"
end

get '/' do
  "<h1> you request nothing </h1>"
end

get '/love' do
%{
<html>
  <body>
    <div style="text-align: center">
      <h1>Welcome to my page</h1>
      <img src="newevoli.jpg" />
      <h1>New Evoli</h1>
    </div>
  </body>
</html>
}  
end

get '/login' do
  %{
<html>
<body>
<h1>please login</h1>
<form action='/login' method='post'>
username: <input type="text" name = 'username'></input><br>
password: <input type="text" name = 'password'></input><br>
<input type='submit' name='login'></input>
</form>
</body>
</html>
}
end

post '/login' do
  username = params[:username]
  password = params[:password]
  "userid = #{username}, password = #{password}"
end

get '/guess/:name' do
  pass unless params[:name] == 'sinatra'
  'you got me'
end

get '/bet/:stake/on/:number' do
  stake = params[:stake].to_i
  number = params[:number].to_i
  roll = rand(6) + 1
  if number == roll
    "the dice landed on #{roll}, you win #{10*stake} dollers"
  else
    "the dice landed on #{roll}, you lost #{stake} dollers"
  end
end

get '/guess/*' do
  'you missed !'
end

not_found do
  "<h3>i don't have a route that match your request</h3>"
end
