require.config
  shim  :
    'jquery.transit' :
      deps    : ['jquery']
      exports : 'jQuery.fn.transit'
  paths :
    jquery           : 'vendor/jquery.min'
    'jquery.transit' : '../components/jquery.transit/jquery.transit'

require ['app', 'jquery.transit'], (app) ->

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
  $cube = $ '#cube'
  $cubeFront = $cube.children '.front'
  $cubeTop = $cube.children '.top'
  $cubeBottom = $cube.children '.bottom'
  $cubeRight = $cube.children '.right'

  $app.on 'click', '._toggle-menu', ->
    $app.toggleClass('toolbar-visible')
    paint()

  $(window).resize ->
                     paint()


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

    #cube

    cubeWidth = $app.width()
    cubeHeight = $app.height()
    cubeDepth = $cubeTop.height()

    size = if cubeWidth > cubeHeight then cubeHeight else cubeWidth


    $cubeBottom.css
      transform : "rotateX(-90deg) translateZ(#{cubeHeight - cubeDepth / 2}px)"
  ###
  $cubeFront.css
    width      : cubeWidth
    height : cubeHeight
    transform  : "rotateY(0deg) translateZ(#{cubeHeight / 2}px)"
  $cubeTop.css
    width      : cubeWidth
    height : cubeHeight
    transform : "rotateX(90deg) translateZ(#{cubeHeight / 2}px)"
  $cubeRight.css
    width      :  cubeHeight
    height :  cubeHeight
    transform : "rotateY(90deg) translateZ(#{cubeWidth - cubeHeight / 2}px)"

###

  
  zoom = (toOut) ->
    cubeWidth = $app.width()
    perspective = if toOut then "#{cubeWidth * 60 / 100}px" else "0"
    $app.css
      '-webkit-perspective' : perspective
      '-moz-perspective'    : perspective
      '-ms-perspective'     : perspective
      '-o-perspective'      : perspective
      'perspective'         : perspective

  turnaround = (isFront) ->
    cubeHeight = $app.height()
    degree = if isFront then 0 else -180
    $cube.transition({
     transform : "translateZ(-#{cubeHeight / 2}px) rotateX(-#{90}deg)"
     }, 500, 'linear', ->
      $cube.transition({
       transform : "translateZ(0px) rotateX(#{degree}deg)"
       }, 500, 'easeOutSine')
    )


  $('.cube-nav a').click ->
                           zoom yes

  $('._toggle-menu:first').click()

  zoom yes
  window.vorne = ->
    #zoom yes
    turnaround yes  

  window.hinten = ->
    #zoom yes
    turnaround no
    
  window.cubify = ->
    $cube.fadeIn(400, ->
      hinten()
      window.setTimeout(vorne,1500)
      
    )

