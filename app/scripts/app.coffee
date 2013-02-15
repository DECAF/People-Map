require ['Cubist', './editor/Editor'], (Cubist, Editor) ->  
  cube = new Cubist document.getElementById('app')
  # generate map
  latlng = new google.maps.LatLng(52.52174, 13.38495)
  myOptions =
    zoom      : 17
    center    : latlng
    #disableDefaultUI : true,
    mapTypeId : google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById('map-container'), myOptions)

  # use app here
  $app = $ '#app'
  $map = $app.find '.map'

  $app.on 'click', '._toggle-menu', ->
    $app.toggleClass('toolbar-visible')
    #paint()

  $app.on 'click', '._open-editor', ->
    cube.goto 1
  $app.on 'click', '._close-editor', ->
    cube.goto 0
    
  $(window).resize ->
    #paint()


  paint = ()->
    #console.log 'painting'
    if $app.hasClass 'toolbar-visible'
      leftOffset = $app.find('header > div').outerWidth()
      fullWidth = $app.width()
      availableWidth = fullWidth - leftOffset
      scaleX = availableWidth / fullWidth

      $map.css
      #transform : "translate3d(#{leftOffset}px, 0, 0) scale3d(#{scaleX}, 1, 1)"
        transform : "scale3d(#{scaleX}, 1, 1)"

      #console.log("translate3d(#{leftOffset}px, 0) scaleX(#{scaleX})")
    else
      $map.css
        transform : 'none'

  #Editor.load 'editor.json'
  
  cube.goto 1

