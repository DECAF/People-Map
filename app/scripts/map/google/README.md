# Google Maps Facade

see https://developers.google.com/maps/documentation/javascript for the complete documentation of the google maps 
javascript api.

## Usage

### include the google api

If you plan to use google maps as a map provider, be sure you included the google maps api in the websites head.

    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>

### include the google maps facade

In the coffeescript build section of the html file, point to the google maps api `Map.js` and `Geocoder.js` files

    <!-- build:js(.tmp) scripts/scripts.js -->
        <script src="scripts/map/google/Map.js"></script>
        <script src="scripts/map/google/Geocoder.js"></script>
        ...
    <!-- endbuild -->
