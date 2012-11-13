#JQuery and CoffeeScript stuff

set_choice_value = ->
  $('input:radio[name=is_correct]:visible').each (index, value) ->
    $(this).val(index)

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    set_choice_value()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    set_choice_value()
