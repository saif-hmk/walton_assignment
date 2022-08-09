/**
 * @Created_By  : AALAA
 * @Date        : 2016.07.11 02:05:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Slide-To-Top.js
 * @Dependencies: Jquery.js, AALAA.js, animate.css
 * @LastModified: 18.05.04
 * @version     : 3.0
 **/
/*==================================================================================================================================================*/

//==================================================================================================================================
//  Slide To Top
//----------------------------------------------------------------------------------------------------------------------------------
$(function () {
    //alert("slideToTop");
    var slideToTop = $("<div />");
    slideToTop.html('<i class="fa fa-chevron-up"></i>');
    slideToTop.css({
        'position'          : 'fixed',
        'bottom'            : '20px',
        'right'             : '25px',
        'width'             : '40px',
        'height'            : '40px',
        'color'             : '#eee',
        'font-size'         : '8',
        'text-align'        : 'center',
        'line-height'       : '40px',
        'background-color'  : '#03A9F4',
        'cursor'            : 'pointer',
        'border-radius'     : '25px',
        'display'           : 'none',
        'opacity'           : '.7',
        'z-index'           : '99999'
    });
    $('.wrapper').append(slideToTop);
    $(window).scroll(function () {
        if ($(window).scrollTop() >= 150) {
            if (!$(slideToTop).is(':visible')) {
                $(slideToTop).fadeIn(500);
            }
        } else {
            $(slideToTop).fadeOut(500);
        }
    });
    slideToTop.on('mouseenter', function () {
        $(this).css('opacity', '1');
    });
    slideToTop.on('mouseout', function () {
        $(this).css('opacity', '.7');
    });
    $(slideToTop).click(function () {
        //alert("working...123")
        //jQuery Tag : >>> animate: function( prop, speed, easing, callback ){}
        //$("body").animate({scrollTop: 0}, 500);   //todo-check : bug.

        $(window).scrollTop(0);                     //temporary.
    });
    $(".sidebar-menu li:not(.treeview) a").click(function () {
        /*
        var $this = $(this);
        var target = $this.attr("href");
        if (typeof target === 'string') {
            $("body").animate({
                scrollTop: ($(target).offset().top) + "px"
            }, 500);
        }
        */

        $(window).scrollTop(0);                     //temporary.
    });
});
/*
 * ======================================================================================================================================================
 */
/*
document.onscroll = function () {
    if ($(window).scrollTop() >= headerHeight + 75) {
        $('.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
    }
    else {
        $('.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top');
    }
}
document.onscroll = function () {
    var header = $('header.banner')
    if ($(window).scrollTop() > headerHeight + 75) {
        header.animate({
            // place your own css styles here
            opacity: 0.5,
        }, 5000, function () {
            header.removeClass('navbar-static-top').addClass('navbar-fixed-top');
        })
    }
    else {
        header.removeClass('navbar-fixed-top').addClass('navbar-static-top');
    }
}
*/
//==================================================================================================================================
