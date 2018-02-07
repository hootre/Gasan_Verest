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

$(function () {
    var toggle = 0;
    $(".toggle_menu h3").click(function () {
        if (toggle == 0) {
            $(".mainmenu .menu_top").slideDown(400);
            toggle = 1;
        } else if (toggle == 1) {
            $(".mainmenu .menu_top").slideUp(400);
            toggle = 0;
        }

    });
});

$(document).ready(function() {
    var autoplaySlider = $('.lightSlider').lightSlider({
        auto:false,
        loop:false,
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