get '/survey' do
  erb :'survey/main'
end

get '/survey/create' do
  erb :'survey/create'
end

post '/survey/create' do
  @survey = Survey.create #takes title and creator_id
  redirect('somewhere')
end

get '/survey/:id' do
  erb :'survey/show'
end



