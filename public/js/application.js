$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var choiceCounter = 0;
  $('.add_question').click(function() {
    $('.question').css("visibility", "visible");
    $('.add_choice').css("visibility", "visible");
  })
  $('.add_choice').click(function(){
    var $choice = $('.choice');
    $choice.first().clone().appendTo( ".choices" ).css("visibility", "visible");
    $('input').last().prop('name', "choices[choice_" + choiceCounter + "]");
    choiceCounter++;

  })




});

  // $(".add_choice").click(function(){
  //   var $choice = $('.choice');
  //   $choice.first().clone().prop('name', 'ham').appendTo( ".choices" ).css("visibility", "visible");
  //   $(this).prop('type', 'date');
  // });
