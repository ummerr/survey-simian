get '/survey' do
  erb :'survey/main'
end

get '/survey/create' do
  erb :'survey/create'
end

post '/survey/create' do
  @survey = Survey.create #takes title and creator_id
  # @question = Question.create(#blah #blah)
  # @choice = Choice.create()
  # a loop that pushes choices into questions
  # @question.choices << @choice
  # a loop that pushes questions into survey
  # @survey.questions << @question


  redirect("/survey/#{@survey.id}")
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :'survey/show'
end






