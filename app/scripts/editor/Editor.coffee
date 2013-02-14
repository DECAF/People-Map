define ['jquery'], ($) ->
  Editor =
    load : (url) ->
      $.getJSON(url).done (json)->
        console.log json
        #$('.edit-json').append JSON.stringify(json)


  return Editor