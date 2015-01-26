$(document).ready(function() {

  var choiceCounter = 0;
  var questionCounter = 0;

  $('.add_question').click(function(event) {
    event.preventDefault();

      $('.questions').append("<div>Question: <input type='text' name=''</div>");
      $('input').last().prop('name', "questions[question_" + questionCounter + "]");
      $('.add_choice').css("visibility", "visible");

      questionCounter++;
  })

  $('.add_choice').click(function(event){
    event.preventDefault();

      $('.questions').append("<div>Choice: <input class='.choice' type='text' name=''</div>");
      $('input').last().prop('name', "choices[question_" + (questionCounter-1) + "][choice_" + choiceCounter + "]");

      choiceCounter++;

  })


  $('.login').on("click",function(event){
    event.preventDefault();
    $('.login_form').removeClass('hidden');
    $('.login').empty();
  })




});

