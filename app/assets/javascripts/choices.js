$('.actions input').click(function(){
  var selected = 0;
  if ($("input[name='is_correct']:checked")){
    selected += 1;
    } 
    if (selected == 1) {

    } else {
      alert ("bad");
      return false;
    }
});