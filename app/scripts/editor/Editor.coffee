define ['jquery'], ($) ->
  
  isArray  = (a) ->
    a instanceof Array

  # check, if a i an `object`
  isObject = (a) ->
    a isnt null and typeof a is 'object' and not isArray(a)

  Editor =
    load : (url) ->
      $.getJSON(url).done (json)->
        console.log json
        #$('.edit-json').append JSON.stringify(json)
        Editor.render json, $('.edit-json')

    render : (json, $el) ->
      for key, value of json
        if isObject value
          $obj = $ '<div class="object"></div>'
          $el.append '<p>"' + key + '" : {</p>'
          $el.append $obj
          $el.append '<p>}",</p>'
          Editor.render value, $obj
        else if isArray value
          $arr = $ '<div class="array"></div>'
          $el.append $arr
          Editor.render value, $arr
        else
          $el.append '<p>"' + key + '" : "' + value + '",</p>'


  return Editor