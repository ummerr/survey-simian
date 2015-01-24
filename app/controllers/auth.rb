get '/' do
  if current_user
    redirect '/survey'
  else
    erb :welcome
  end
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(name: params[:user][:name])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect '/survey'
  else
    redirect '/login'
  end

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
  session[:user_id] = nil
  redirect '/'
end

