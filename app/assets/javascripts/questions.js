$(document).ready(function() {
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