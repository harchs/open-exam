$(document).ready(function() {

  // $(".actions#question_submission > :submit[name='commit']").click( function (e) {

  //    var selected = 0;

  //    $("input[name='is_correct']:checked").each(function(){
  //      selected += 1;
  //    });

  //    if (selected == 1) {
  //    } else {
  //      alert ("You must select a choice.");
  //      return false;
  //    }

  // });

  $('input#submit_question').click(function(e){
    if ($('form#new_question input:radio:checked').length <= 0) {
      if ($('#error_explanation').length > 0)
      {
        $('#error_explanation ul').append('<li>Please select a correct answer.</li>');
      } else {
        $('form#new_question').prepend('<div class="alert">Please select a correct answer.</div>');
      }
      return false;
    }
  })

});