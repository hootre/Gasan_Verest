function initMap() {
    var uluru = {lat: 37.5664685, lng: 127.04425040000001};
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 16,
        center: uluru
    });
    var marker = new google.maps.Marker({
        position: uluru,
        map: map
    });
}

$(document).ready(function() {
    var autoplaySlider = $('#lightSlider').lightSlider({
        auto:false,
        loop:true,
        pauseOnHover: true,
        item: 4,
        responsive: [{
            breakpoint: 1067,
            settings: {
                item: 3,
                slideMove: 1,
                slideMargin: 6,
            }
        }, {
            breakpoint: 681,
            settings: {
                item: 2,
                slideMove: 1
            }
        }, {
            breakpoint: 411,
            settings: {
                item: 1,
                slideMove: 1
            }
        }]
    });

    var autoplaySlider2 = $('#lightSlider2').lightSlider({
        auto:false,
        loop:true,
        pauseOnHover: true,
        item: 4,
        responsive: [{
            breakpoint: 1067,
            settings: {
                item: 3,
                slideMove: 1,
                slideMargin: 6,
            }
        }, {
            breakpoint: 681,
            settings: {
                item: 2,
                slideMove: 1
            }
        }, {
            breakpoint: 411,
            settings: {
                item: 1,
                slideMove: 1
            }
        }]
    });
});