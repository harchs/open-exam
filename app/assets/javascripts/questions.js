$(document).ready(function() {
  $('#submit_question').click(function(e){
    if ($('form input:radio:checked').length <= 0) {
      if ($('#error_explanation').length > 0)
      {
        $('#error_explanation ul').append('<li>Please select a correct answer.</li>');
      } else {
        $('form#new_question, form.edit_question').prepend('<div class="alert">Please select a correct answer.</div>');
      }
      return false;
    }
  })

});