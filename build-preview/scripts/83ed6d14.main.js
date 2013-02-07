(function() {

  require.config({
    shim: {},
    paths: {
      jquery: 'vendor/jquery.min'
    }
  });

  require(['app'], function(app) {
    var $app, $map, latlng, map, myOptions, paint;
    latlng = new google.maps.LatLng(52.52174, 13.38495);
    myOptions = {
      zoom: 17,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('map-container'), myOptions);
    $app = $('#app');
    $map = $app.find('.map');
    $app.on('click', '._toggle-menu', function() {
      $app.toggleClass('toolbar-visible');
      return paint();
    });
    $(window).resize(function() {
      return paint();
    });
    return paint = function() {
      var availableWidth, fullWidth, leftOffset, scaleX;
      console.log('painting');
      if ($app.hasClass('toolbar-visible')) {
        leftOffset = $app.find('header > div').outerWidth();
        fullWidth = $app.width();
        availableWidth = fullWidth - leftOffset;
        scaleX = availableWidth / fullWidth;
        $map.css({
          transform: "translate3d(" + leftOffset + "px, 0, 0) scaleX(" + scaleX + ")"
        });
        return console.log("translate3d(" + leftOffset + "px, 0) scaleX(" + scaleX + ")");
      } else {
        return $map.css({
          transform: 'initial'
        });
      }
    };
  });

}).call(this);
