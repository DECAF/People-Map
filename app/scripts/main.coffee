require.config
  shim  :
    {}
  paths :
    jquery : 'vendor/jquery.min'

require ['app'], (app) ->

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
    paint()

  $(window).resize ->
    paint()
                  

  paint = ()->
    console.log 'painting'
    if $app.hasClass 'toolbar-visible'
      leftOffset = $app.find('header > div').outerWidth()
      fullWidth = $app.width()
      availableWidth = fullWidth - leftOffset
      scaleX = availableWidth / fullWidth

      $map.css
        transform : "translate3d(#{leftOffset}px, 0, 0) scaleX(#{scaleX})"

      console.log("translate3d(#{leftOffset}px, 0) scaleX(#{scaleX})")
    else
      $map.css
        transform : 'initial'

#$('._toggle-menu:first').click()