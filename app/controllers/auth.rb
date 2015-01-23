get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end

post '/login' do


end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/survey'
  else
    redirect '/signup'
  end

end

get '/logout' do

end

