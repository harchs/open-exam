$(document).ready(function() {

  $(".actions > :submit[name='commit']").click( function (e) {

     var selected = 0;

     $("input[name='is_correct']:checked").each(function(){
       selected += 1;
     });

     if (selected == 1) {
     } else {
       alert ("You must select a choice.");
       return false;
     }

  });

});