get '/survey' do
  erb :'survey/main'
end

get '/survey/create' do
  erb :'survey/create'
end

post '/survey/create' do
  @survey = Survey.create
  @survey.title = params[:title]
  question = Question.create(name: params[:question])
  @survey.questions << question
  User.first.created_surveys << @survey   # session[:user_id]  ADD IN ONCE SESSIONS ARE ENABLED!!!!!
  choices = []
  params[:choices].each { |key, value| choices << Choice.create(name: value) }
  @survey.questions.first.choices << choices  # Only supports survey with one question, add functionality here to support multiple questions.

  redirect("/survey/#{@survey.id}")
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/show'
end



