require 'sinatra'

configure do
    enable :sessions
end

get '/get/:name' do
    if sessions[:name] && sessions[:name] == params[:name]
        add_count   # helper
        erb :view
    else
        sessions[:name] = par   ams[:name]
        sessions[:visit] = 0
        "hello, #{sessions[:name]}, welcome"
    end
end

# get '/hello' do
#     if sessions[:name]
#         add_count
#         erb :view
#     else
#         "welcome to my page at hello route"
#     end
# end

# get '/' do
#     if sessions[:name]
#         add_count
#         erb :view
#     else
#         "welcome to my page at root route"
#     end
# end

['/', 'hello'].each do |route|
    get route do
        if sessions[:name]
            add_count
            erb :view
        else
            "welcome to my page at #{route} route"
        end
    end
end

get '/try' do
    if sessions[:name]
        add_count
        sessions[:msg] = message
        redirect to '/another'
    else
        "welcome to my page at try route"
    end
end

get '/another' do
    add_count
    sessions[:msg]
end

get 'logout' do
    sessions.clear
    "logging out..."
end

helpers do      # just to organize
    def add_count
        count = (sessions[:visit] || 0).to_i
        count += 1
        sessions[visit = count]
    end

    def message
        "hello #{session[:name]}, you've visited here #{session[:visit]} times"
    end
end
