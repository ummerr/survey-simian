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
  params[:questions].each do |question_num, question_value|
    @survey.questions << Question.create(name: question_value)
    choices = []
    choices << params[:choices][question_num.to_sym].map { |key, choice| Choice.create(name: choice) }
    @survey.questions.last.choices << choices
  end
  
  @survey.save

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
  params[:choices].each do |key, choice_id|
    Answer.create(choice_id: choice_id.to_i, user_id: current_user.id)
  end
  
  redirect("/survey/#{params[:survey_id]}/results")
end
