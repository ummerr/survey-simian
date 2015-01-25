$(document).ready(function() {

  var choiceCounter = 0;

  $('.add_question').click(function(event) {
    event.preventDefault();

      $('.question').css("visibility", "visible");
      $('.add_choice').css("visibility", "visible");
  })

  $('.add_choice').click(function(event){
    event.preventDefault();

      var $choice = $('.choice');
      // $choice.first().clone().appendTo( ".choices" ).css("visibility", "visible");
      // $('input').last().prop('name', "choices[choice_" + choiceCounter + "]");
      $('.choices').append("<div>Choice: <input type='text' name=''</div>");
      $('input').last().prop('name', "choices[choice_" + choiceCounter + "]");

      choiceCounter++;

  })

  $('.login').on("click",function(event){
    event.preventDefault();
    $('.login_form').removeClass('hidden');
    $('.login').empty();
  })




});

