get '/survey' do
  erb :'survey/main'
end

get '/survey/all' do
  @surveys = Survey.all
  erb :'survey/all'
end

get '/survey/create' do
  erb :'survey/create'
end

post '/survey/create' do
  @survey = Survey.create
  @survey.title = params[:title]
  question = Question.create(name: params[:question])
  @survey.questions << question
  current_user.created_surveys << @survey
  choices = []
  params[:choices].each { |key, value| choices << Choice.create(name: value) }
  @survey.questions.first.choices << choices  # Only supports survey with one question, add functionality here to support multiple questions.

  redirect("/survey/#{@survey.id}")
end

get '/survey/:id/results' do
  @survey = Survey.find_by(id: params[:id])
  erb :'survey/results'
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/show'
end

post '/survey/:id' do
  answer = Answer.create(choice_id: params[:choice_id], user_id: current_user.id)
  redirect("/survey/#{params[:survey_id]}/results")
end
