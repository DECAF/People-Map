require.config({
    shim: {
        'jquery.transit': {
            deps: ['jquery'],
            exports: 'jQuery.fn.transit'
        }
    },
    paths: {
        jquery: 'vendor/jquery.min',
        'jquery.transit': '../components/jquery.transit/jquery.transit',
        'Cubist': 'vendor/cubist.min'
    }
});

require(['app']);