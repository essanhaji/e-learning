/**
  * courseCarousel
  * responsiveMenu
  * partnersCarousel
  * testimonialCarousel
  * teacherCarousel
  * certificatesCarousel
  * flatAccordion
  * blogSlider
  * detectViewport
  * counter
  * portfolioIsotope
  * googleMap
  * ajaxContactForm
  * alertBox
  * tabs
  * goTop
  * flatAccordion
  * selectLayout
  * flatSearch
  * swClick
  * headerFixed
  * removePreloader
 */

;(function($) {

   'use strict'
   var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    };

    var courseCarousel = function() {
         $('.flat-row').each(function() {               
            if ( $().owlCarousel ) {
                $(this).find('.flat-course-grid').owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: true,
                    dots: false,                     
                    autoplay: true,                    
                    responsive:{
                        0:{
                            items: 1
                        },

                        479:{
                            items: 2
                        },
                        991:{
                            items: 2
                        },
                        1200: {
                            items: 3
                        }
                    }
                });
            }
        });
    };

    var responsiveMenu = function() {
        var menuType = 'desktop';

        $(window).on('load resize', function() {
            var currMenuType = 'desktop';
            if ( matchMedia( 'only screen and (max-width: 1199px)' ).matches ) {
                currMenuType = 'mobile';
            }

            if ( currMenuType !== menuType ) {
                menuType = currMenuType;

                if ( currMenuType === 'mobile' ) {
                    var $mobileMenu = $('#mainnav').attr('id', 'mainnav-mobi').hide();
                    var hasChildMenu = $('#mainnav-mobi').find('li:has(ul)');

                    $('#header').after($mobileMenu);
                    hasChildMenu.children('ul').hide();
                    hasChildMenu.children('a').after('<span class="btn-submenu"></span>');
                    $('.btn-menu').removeClass('active');
                } else {
                    var $desktopMenu = $('#mainnav-mobi').attr('id', 'mainnav').removeAttr('style');

                    $desktopMenu.find('.submenu').removeAttr('style');
                    $('#header').find('.nav-wrap').append($desktopMenu);
                    $('.btn-submenu').remove();
                }
            }
        });

        $('.btn-menu').on('click', function() {         
            $('#mainnav-mobi').slideToggle(300);
            $(this).toggleClass('active');
        });

        $(document).on('click', '#mainnav-mobi li .btn-submenu', function(e) {
            $(this).toggleClass('active').next('ul').slideToggle(300);
            e.stopImmediatePropagation()
        });
    }

    var partnersCarousel = function() {
        $('.flat-row').each(function() {               
            if ( $().owlCarousel ) {
                $(this).find('.partners-slider').owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: false,
                    dots: false,                     
                    autoplay: true,                    
                    responsive:{
                        0:{
                            items: 2
                        },
                        479:{
                            items: 3
                        },
                        767:{
                            items: 4
                        },
                        991:{
                            items: 5
                        },
                        1200: {
                            items: 6
                        }
                    }
                });
            }
        });
    };

    var testimonialCarousel = function() {
        $('.flat-row').each(function() {               
            if ( $().owlCarousel ) {
                $(this).find('.testimonial-slider').owlCarousel({
                    loop: true,
                    margin: 0,
                    nav: false,
                    dots: true,                     
                    autoplay: true,                    
                    items: 1
                });
            }
        });
    };

    var teacherCarousel = function() {
        $('.flat-row').each(function() {               
            if ( $().owlCarousel ) {
                $(this).find('.flat-teacher-team').owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: true,
                    dots: false,                     
                    autoplay: true,                    
                    responsive:{
                        0:{
                            items: 1
                        },
                        479:{
                            items: 2
                        },
                        767:{
                            items: 2
                        },
                        991:{
                            items: 3
                        },
                        1200: {
                            items: 4
                        }
                    }
                });
            }
        });
    }

    var certificatesCarousel = function() {
        $('.flat-row').each(function() {               
            if ( $().owlCarousel ) {
                $(this).find('.flat-certificates').owlCarousel({
                    loop: true,
                    margin: 30,
                    nav: false,
                    dots: true,                     
                    autoplay: true,                    
                    responsive:{
                        0:{
                            items: 1
                        },
                        479:{
                            items: 2
                        }
                    }
                });
            }
        });
    }

    var flatAccordion = function() {
        var args = {duration: 600};
        $('.flat-toggle .toggle-title.active').siblings('.toggle-content').show();

        $('.flat-toggle.enable .toggle-title').on('click', function() {
            $(this).closest('.flat-toggle').find('.toggle-content').slideToggle(args);
            $(this).toggleClass('active');
        }); // toggle 

        $('.flat-accordion .toggle-title').on('click', function () {
            if( !$(this).is('.active') ) {
                $(this).closest('.flat-accordion').find('.toggle-title.active').toggleClass('active').next().slideToggle(args);
                $(this).toggleClass('active');
                $(this).next().slideToggle(args);
            } else {
                $(this).toggleClass('active');
                $(this).next().slideToggle(args);
            }     
        }); // accordion
    }; 

   var blogSlider = function() {
        if ( $().flexslider ) {
            $('.blog-slider').each(function() {
                var $this = $(this),
                    easing = ( $this.data('effect') == 'fade' ) ? 'linear' : 'easeInOutExpo';

                $this.find('.flexslider').flexslider({
                    animation      :  $this.data('effect'),
                    direction      :  $this.data('direction'), // vertical
                    pauseOnHover   :  true,
                    useCSS         :  false,
                    easing         :  easing,
                    animationSpeed :  500,
                    slideshowSpeed :  5000,
                    controlNav     :  true,
                    directionNav   :  true,
                    slideshow      :  $this.data('auto'),
                    prevText       :  '<i class="fa fa-angle-left" aria-hidden="true"></i>',
                    nextText       :  '<i class="fa fa-angle-right" aria-hidden="true"></i>',
                    smoothHeight   :  true
                }); // flexslider
            }); // blog-sider
        }
    };

    var detectViewport = function() {
        $('[data-waypoint-active="yes"]').waypoint(function() {
            $(this).trigger('on-appear');
        }, { offset: '90%', triggerOnce: true });

        $(window).on('load', function() {
            setTimeout(function() {
                $.waypoints('refresh');
            }, 100);
        });
    };

    var counter = function() {
        $('.counter-content').on('on-appear', function() {            
            $(this).find('.numb-count').each(function() { 
                var to = parseInt( ($(this).attr('data-to')),10 ), speed = parseInt( ($(this).attr('data-speed')),10 );
                if ( $().countTo ) {
                    $(this).countTo({
                        to: to,
                        speed: speed
                    });
                }
            });
       });
    };

    var portfolioIsotope = function() {         
        if ( $().isotope ) {           
            var $container = $('.flat-teacher-team-isotope');
            $container.imagesLoaded(function(){
                $container.isotope({
                    itemSelector: '.flat-teacher',
                    transitionDuration: '1s'
                });
            });

            $('.portfolio-filter li').on('click',function() {                           
                var selector = $(this).find("a").attr('data-filter');
                $('.portfolio-filter li').removeClass('active');
                $(this).addClass('active');
                $container.isotope({ filter: selector });
                return false;
            });            
        };
    };

     var googleMap = function() {
        if ( $().gmap3 ) {
            $("#map").gmap3({
                map:{
                    options:{
                        zoom: 14,
                        mapTypeId: 'nah_style',
                        mapTypeControlOptions: {
                            mapTypeIds: ['nah_style', google.maps.MapTypeId.SATELLITE, google.maps.MapTypeId.HYBRID]
                        },
                        scrollwheel: false
                    }
                },
                getlatlng:{
                    address:  "Big Ben Street, E16 3LS, London, United Kingdom",
                    callback: function(results) {
                        if ( !results ) return;
                        $(this).gmap3('get').setCenter(new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng()));
                    }
                },
                styledmaptype:{
                    id: "nah_style",
                    options:{
                        name: "Nah Map"
                    },
                    styles: [
                        {
                            "featureType": "water",
                            "stylers": [
                                { "color": "#81abff" }
                            ]
                        },
                        
                        {
                            "featureType": "road.local",
                            "stylers": [
                              { "color": "#edebe3" }
                            ]
                        },
                        {
                            "featureType": "road.highway",
                            "stylers": [
                              { "color": "#e3e3e3" }
                            ]
                       },
                       {
                            "featureType": "poi.park",
                            "stylers": [
                              { "color": "#c0d997" }
                            ]
                       }                                              
                    ]
                },  
            });
        }
    }; 

    var ajaxContactForm = function() {  
        $('#contactform').each(function() {
            $(this).validate({
                submitHandler: function( form ) {
                    var $form = $(form),
                        str = $form.serialize(),
                        loading = $('<div />', { 'class': 'loading' });

                    $.ajax({
                        type: "POST",
                        url:  $form.attr('action'),
                        data: str,
                        beforeSend: function () {
                            $form.find('.submit-wrap').append(loading);
                        },
                        success: function( msg ) {
                            var result, cls;                            
                            if ( msg == 'Success' ) {                                
                                result = 'Message Sent Successfully To Email Administrator. ( You can change the email management a very easy way to get the message of customers in the user manual )';
                                cls = 'msg-success';
                            } else {
                                result = 'Error sending email.';
                                cls = 'msg-error';
                            }

                            $form.prepend(
                                $('<div />', {
                                    'class': 'flat-alert ' + cls,
                                    'text' : result
                                }).append(
                                    $('<a class="close" href="#"><i class="fa fa-close"></i></a>')
                                )
                            );

                            $form.find(':input').not('.submit').val('');
                        },
                        complete: function (xhr, status, error_thrown) {
                            $form.find('.loading').remove();
                        }
                    });
                }
            });
        }); // each contactform
    };   

    var alertBox = function() {
        $(document).on('click', '.close', function(e) {
            $(this).closest('.flat-alert').remove();
            e.preventDefault();
        })     
    } 

    var tabs = function() {
        $('.flat-tabs').each(function() {

            $(this).children('.content-tab').children().hide();
            $(this).children('.content-tab').children().first().show();

            $(this).find('.menu-tab').children('li').on('click', function(e) {
                var liActive = $(this).index(),
                    contentActive = $(this).siblings().removeClass('active').parents('.flat-tabs').children('.content-tab').children().eq(liActive);

                contentActive.addClass('active').fadeIn('slow');
                contentActive.siblings().removeClass('active');
                $(this).addClass('active').parents('.flat-tabs').children('.content-tab').children().eq(liActive).siblings().hide();
                e.preventDefault();
            });
        });
    };  

    var goTop = function() {
        $(window).scroll(function() {
            if ( $(this).scrollTop() > 800 ) {
                $('.go-top').addClass('show');
            } else {
                $('.go-top').removeClass('show');
            }
        }); 

        $('.go-top').on('click', function() {            
            $("html, body").animate({ scrollTop: 0 }, 1000 , 'easeInOutExpo');
            return false;
        });
    };

    var flatAccordion = function() {
        var args = {duration: 600};
        $('.flat-toggle .toggle-title.active').siblings('.toggle-content').show();

        $('.flat-toggle.enable .toggle-title').on('click', function() {
            $(this).closest('.flat-toggle').find('.toggle-content').slideToggle(args);
            $(this).toggleClass('active');
        }); // toggle 

        $('.flat-accordion .toggle-title').on('click', function () {
            if( !$(this).is('.active') ) {
                $(this).closest('.flat-accordion').find('.toggle-title.active').toggleClass('active').next().slideToggle(args);
                $(this).toggleClass('active');
                $(this).next().slideToggle(args);
            } else {
                $(this).toggleClass('active');
                $(this).next().slideToggle(args);
            }     
        }); // accordion
    }; 

    var selectLayout = function () {
        $(".list-grid a").on("click", function() {
            $(this).parent().find("a").removeClass("active");
            $(this).addClass("active");
            $(".main-content").removeClass("course-list course-grid");
            $(".main-content").addClass($(this).data("layout"));
        })
    }

     var flatSearch = function () {
        $(document).on('click', function(e) {   
            var clickID = e.target.id;   
            if ( ( clickID != 's' ) ) {
                $('.top-search').removeClass('show');                
            } 
        });

        $('.show-search').on('click', function(event){
            event.stopPropagation();
        });

        $('.search-form').on('click', function(event){
            event.stopPropagation();
        });        

        $('.show-search').on('click', function () {
            if(!$('.top-search').hasClass( "show" ))
                $('.top-search').addClass('show');
            else
                $('.top-search').removeClass('show');
        });
    }

    var swClick = function () {
        function activeLayout () {
            $(".switcher-container" ).on( "click", "a.sw-light", function() {
                $(this).toggleClass( "active" );
                $('body').addClass('home-boxed');  
                $('body').css({'background': '#f6f6f6' });                
                $('.sw-pattern.pattern').css ({ "top": "100%", "opacity": 1, "z-index": "10"});
            }).on( "click", "a.sw-dark", function() {
                $('.sw-pattern.pattern').css ({ "top": "98%", "opacity": 0, "z-index": "-1"});
                $(this).removeClass('active').addClass('active');
                $('body').removeClass('home-boxed');
                $('body').css({'background': '#fff' });
                return false;
            })       
        }
    

        function activePattern () {
            $('.sw-pattern').on('click', function () {
                $('.sw-pattern.pattern a').removeClass('current');
                $(this).addClass('current');
                $('body').css({'background': 'url("' + $(this).data('image') + '")', 'background-size' : '30px 30px', 'background-repeat': 'repeat' });
                return false
            })
        }

        activeLayout(); 
        activePattern();
    }

    var headerFixed = function() {        

        if ( $('body').hasClass('header-sticky') ) {
            var hd_height = $('#header').height();           
            $(window).on('load scroll', function(){                
                if ( $(window).scrollTop() > hd_height + 30 ) {
                    $('#header').addClass('downscrolled');                      
                } else {                    
                    $('#header').removeClass('downscrolled');                   
                }
                if( $(window).scrollTop() > 145 ) {
                    $('#header').addClass('upscrolled');                    
                } else {
                    $('#header').removeClass('upscrolled');                    
                }
            })            
        }   
    }

    var parallax = function() {
        if ( $().parallax && isMobile.any() == null ) {
            $('.parallax1').parallax("50%", 0.3);
            $('.parallax2').parallax("50%", 0.3);  
            $('.parallax3').parallax("50%", 0.3);
            $('.parallax4').parallax("50%", 0.6);            
        }
    };

    var removePreloader = function() {   
            $('.windows8').fadeOut('slow',function () {
                $(this).remove();
            });
    }; 

   	// Dom Ready
	$(function() {
        responsiveMenu(); 
        courseCarousel();
        partnersCarousel();
        testimonialCarousel();
        teacherCarousel();
        certificatesCarousel();
        flatAccordion();
        portfolioIsotope();
        swClick();
        parallax();
        // blogSlider();
        counter(); 
        detectViewport(); 
        goTop();    
        googleMap();
        ajaxContactForm();
        alertBox();
        tabs();
        selectLayout();
        flatSearch();
        headerFixed();
        removePreloader(); 
   	});

})(jQuery);