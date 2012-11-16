$(document).ready(function() {
  $('#submit_question').click(function(e){
    console.log('here');
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