/**
 * @Created_By  : AALAA
 * @Date        : 2017.09.27 01:00:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Geolocation.js
 * @Dependencies: Jquery.js, AALAA.js, AALAA-Confirm.js, slimscroll.js, directChat.js, Fastclick.js
 * @LastModified: 18.05.04
 * @version     : 5.0
 *
 * Main JS application file for r_gt_adminLte v2.
 * This file should include at main page.
 * It controls some layout options and implements exclusive AALAA plugins.
 *
 * Note : Make sure jQuery has been loaded before AALAA.js
 **/
/*==================================================================================================================================================*/

if (typeof jQuery === "undefined") {
    throw new Error("AALAA requires jQuery...!");
}
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * AALAA
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * @type Object
 * @description $.AALAA is the main object for the template's AALAA.
 *              It's used for implementing functions and options related
 *              to the template. Keeping everything wrapped in an object
 *              prevents conflict with other plugins and is a better
 *              way to organize our code.
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
$.AALAA = {};
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * AALAA Options
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Note : Modify these options to suit your implementation
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
$.AALAA.options = {
    //Add slimscroll to navbar menus. This requires you to load the slimscroll plugin in every page before app.js
    navbarMenuSlimscroll        : true,
    navbarMenuSlimscrollWidth   : "3px",    //The width of the scroll bar
    navbarMenuHeight            : "200px",  //The height of the inner menu
    //General animation speed for JS animated elements such as box collapse/expand and sidebar treeview slide up/down.
    // This options accepts an integer as milliseconds, 'fast', 'normal', or 'slow'
    animationSpeed              : 500,
    //Activate sidebar slimscroll if the fixed layout is set (requires SlimScroll Plugin)
    sidebarSlimScroll           : true,
    enableBSTooltip             : true, //Bootstrap.js tooltip
    BSTooltipSelector           : "[data-toggle='tooltip']",
    //Enable Fast Click. Fastclick.js creates a more native touch experience with touch devices.
    //If you choose to enable the plugin, make sure you load the script before AALAA's app.js
    enableFastclick             : true,
    enableControlSidebar        : true, //Control Sidebar Options
    controlSidebarOptions       : {
        toggleBtnSelector       : "[data-toggle='control-sidebar']",    //Which button should trigger the open/close event
        selector                : ".control-sidebar",                   //The sidebar selector
        slide                   : true                                  //Enable slide over content
    },
    enableBoxWidget             : true, //Box Widget Plugin. Enable this plugin to allow boxes to be collapsed and/or removed
    boxWidgetOptions            : {     //Box Widget plugin options
        boxWidgetIcons  		: {
            collapse    		: 'fa-minus',   //Collapse icon
            open        		: 'fa-plus',    //Open icon
            remove      		: 'fa-times'    //Remove icon
        },
        boxWidgetSelectors      : {
            remove      		: '[data-widget="remove"]',     //Remove button selector
            collapse    		: '[data-widget="collapse"]'    //Collapse button selector
        }
    },
    directChat                  : {                                     //Direct Chat plugin options
        enable                  : true,                                 //Enable direct chat by default
        contactToggleSelector   : '[data-widget="chat-pane-toggle"]'    //The button to open and close the chat contacts pane
    },
    colors: {                   //Define the set of colors to use globally around the website
        aqua     : "#00c0ef",
        black    : "#222222",
        blue     : "#0073b7",
        fuchsia  : "#F012BE",
        gray     : "#d2d6de",
        green    : "#00a65a",
        lightBlue: "#3c8dbc",
        lime     : "#01FF70",
        maroon   : "#D81B60",
        navy     : "#001F3F",
        olive    : "#3D9970",
        orange   : "#FF851B",
        purple   : "#8E24AA",
        red      : "#f56954",
        teal     : "#39CCCC",
        yellow   : "#f39c12"
    },
    screenSizes: {              //The standard screen sizes that bootstrap uses. If you change these in the variables.less file, change them here too.
        xs: 480,
        sm: 768,
        md: 992,
        lg: 1200
    }
};
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Implementation
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Description : The next block of code implements AALAA's functions and plugins as specified by the options above.
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
$(function (){
    "use strict";

    //Fix for IE page transitions
    $("body").removeClass("hold-transition");

    //Extend options if external options exist
    if (typeof AALAAOptions !== "undefined") {
        $.extend(true, $.AALAA.options, AALAAOptions);
    }

    //Easy access to options
    var o = $.AALAA.options;

    //Set up the object
    _init();

    //Activate the layout maker
    //$.AALAA.layout.activate();

    //Enable sidebar tree view controls
    //$.AALAA.tree('.sidebar');

    //Enable control sidebar
    //if (o.enableControlSidebar) {
    //    $.AALAA.controlSidebar.activate();
    //}

    //Add slimscroll to navbar dropdown
    if (o.navbarMenuSlimscroll && typeof $.fn.slimscroll != 'undefined') {
        $(".navbar .menu").slimscroll({
            height: o.navbarMenuHeight,
            alwaysVisible: false,
            size: o.navbarMenuSlimscrollWidth
        }).css("width", "100%");
    }

    //Activate sidebar push menu
    if (o.sidebarPushMenu) {
        $.AALAA.pushMenu.activate(o.sidebarToggleSelector);
    }

    //Activate Bootstrap tooltip
    if (o.enableBSToppltip) {
        $('body').tooltip({
            selector: o.BSTooltipSelector
        });
    }

    //Activate box widget
    //if (o.enableBoxWidget) {
    //    $.AALAA.boxWidget.activate();
    //}

    //Activate fast click
    if (o.enableFastclick && typeof FastClick != 'undefined') {
        FastClick.attach(document.body);
    }

    //Activate direct chat widget
    if (o.directChat.enable) {
        $(document).on('click', o.directChat.contactToggleSelector, function () {
            var box = $(this).parents('.direct-chat').first();
            box.toggleClass('direct-chat-contacts-open');
        });
    }

    /*
     * INITIALIZE BUTTON TOGGLE
     * ------------------------
     */
    $('.btn-group[data-toggle="btn-toggle"]').each(function () {
        var group = $(this);
        $(this).find(".btn").on('click', function (e) {
            group.find(".btn.active").removeClass("active");
            $(this).addClass("active");
            e.preventDefault();
        });
    });
});
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Initialize the AALAA Object
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Description : All AALAA functions are implemented below.
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
function _init() {
    'use strict';
    /* Layout
     * ======
     * Fixes the layout height in case min-height fails.
     *
     * @type Object
     * @usage: $.AALAA.layout.activate()
     *        $.AALAA.layout.fix()
     *        $.AALAA.layout.fixSidebar()
     */
    $.AALAA.layout = {
        activate: function () {
            var _this = this;
            _this.fix();
            _this.fixSidebar();
            $(window, ".wrapper").resize(function () {
                _this.fix();
                _this.fixSidebar();
            });
        },
        fix: function () {
            //Get window height and the wrapper height
            var neg = $('.main-header').outerHeight() + $('.main-footer').outerHeight();
            var window_height = $(window).height();
            var sidebar_height = $(".sidebar").height();
            //Set the min-height of the content and sidebar based on the
            //the height of the document.
            if ($("body").hasClass("fixed")) {
                $(".content-wrapper, .right-side").css('min-height', window_height - $('.main-footer').outerHeight());
            } else {
                var postSetWidth;
                if (window_height >= sidebar_height) {
                    $(".content-wrapper, .right-side").css('min-height', window_height - neg);
                    postSetWidth = window_height - neg;
                } else {
                    $(".content-wrapper, .right-side").css('min-height', sidebar_height);
                    postSetWidth = sidebar_height;
                }

                //Fix for the control sidebar height
                var controlSidebar = $($.AALAA.options.controlSidebarOptions.selector);
                if (typeof controlSidebar !== "undefined") {
                    if (controlSidebar.height() > postSetWidth)
                        $(".content-wrapper, .right-side").css('min-height', controlSidebar.height());
                }

            }
        },
        fixSidebar: function () {
            //Make sure the body tag has the .fixed class
            if (!$("body").hasClass("fixed")) {
                if (typeof $.fn.slimScroll != 'undefined') {
                    $(".sidebar").slimScroll({destroy: true}).height("auto");
                }
                return;
            } else if (typeof $.fn.slimScroll == 'undefined' && window.console) {
                window.console.error("Error: the fixed layout requires the slimscroll plugin!");
            }
            //Enable slimscroll for fixed layout
            if ($.AALAA.options.sidebarSlimScroll) {
                if (typeof $.fn.slimScroll != 'undefined') {
                    //Destroy if it exists
                    $(".sidebar").slimScroll({destroy: true}).height("auto");
                    //Add slimscroll
                    $(".sidebar").slimscroll({
                        height: ($(window).height() - $(".main-header").height()) + "px",
                        color: "rgba(0,0,0,0.2)",
                        size: "3px"
                    });
                }
            }
        }
    };

    /* PushMenu()
     * ==========
     * Adds the push menu functionality to the sidebar.
     *
     * @type Function
     * @usage: $.AALAA.pushMenu("[data-toggle='offcanvas']")
     */
    $.AALAA.pushMenu = {
        activate: function (toggleBtn) {
            //Get the screen sizes
            var screenSizes = $.AALAA.options.screenSizes;

            //Enable sidebar toggle
            $(document).on('click', toggleBtn, function (e) {
                e.preventDefault();

                //Enable sidebar push menu
                if ($(window).width() > (screenSizes.sm - 1)) {
                    if ($("body").hasClass('sidebar-collapse')) {
                        $("body").removeClass('sidebar-collapse').trigger('expanded.pushMenu');
                    } else {
                        $("body").addClass('sidebar-collapse').trigger('collapsed.pushMenu');
                    }
                }
                //Handle sidebar push menu for small screens
                else {
                    if ($("body").hasClass('sidebar-open')) {
                        $("body").removeClass('sidebar-open').removeClass('sidebar-collapse').trigger('collapsed.pushMenu');
                    } else {
                        $("body").addClass('sidebar-open').trigger('expanded.pushMenu');
                    }
                }
            });

            $(".content-wrapper").click(function () {
                //Enable hide menu when clicking on the content-wrapper on small screens
                if ($(window).width() <= (screenSizes.sm - 1) && $("body").hasClass("sidebar-open")) {
                    $("body").removeClass('sidebar-open');
                }
            });

            //Enable expand on hover for sidebar mini
            if ($.AALAA.options.sidebarExpandOnHover
                || ($('body').hasClass('fixed')
                    && $('body').hasClass('sidebar-mini'))) {
                this.expandOnHover();
            }
        },
        expandOnHover: function () {
            var _this = this;
            var screenWidth = $.AALAA.options.screenSizes.sm - 1;
            //Expand sidebar on hover
            $('.main-sidebar').hover(function () {
                if ($('body').hasClass('sidebar-mini')
                    && $("body").hasClass('sidebar-collapse')
                    && $(window).width() > screenWidth) {
                    _this.expand();
                }
            }, function () {
                if ($('body').hasClass('sidebar-mini')
                    && $('body').hasClass('sidebar-expanded-on-hover')
                    && $(window).width() > screenWidth) {
                    _this.collapse();
                }
            });
        },
        expand: function () {
            $("body").removeClass('sidebar-collapse').addClass('sidebar-expanded-on-hover');
        },
        collapse: function () {
            if ($('body').hasClass('sidebar-expanded-on-hover')) {
                $('body').removeClass('sidebar-expanded-on-hover').addClass('sidebar-collapse');
            }
        }
    };

    /* Tree()
     * ======
     * Converts the sidebar into a multilevel
     * tree view menu.
     *
     * @type Function
     * @Usage: $.AALAA.tree('.sidebar')
     */
    $.AALAA.tree = function (menu) {
        var _this = this;
        var animationSpeed = $.AALAA.options.animationSpeed;
        $(document).off('click', menu + ' li a')
            .on('click', menu + ' li a', function (e) {
                //Get the clicked link and the next element
                var $this = $(this);
                var checkElement = $this.next();

                //Check if the next element is a menu and is visible
                if ((checkElement.is('.treeview-menu')) && (checkElement.is(':visible')) && (!$('body').hasClass('sidebar-collapse'))) {
                    //Close the menu
                    checkElement.slideUp(animationSpeed, function () {
                        checkElement.removeClass('menu-open');
                        //Fix the layout in case the sidebar stretches over the height of the window
                        //_this.layout.fix();
                    });
                    checkElement.parent("li").removeClass("active");
                }
                //If the menu is not visible
                else if ((checkElement.is('.treeview-menu')) && (!checkElement.is(':visible'))) {
                    //Get the parent menu
                    var parent = $this.parents('ul').first();
                    //Close all open menus within the parent
                    var ul = parent.find('ul:visible').slideUp(animationSpeed);
                    //Remove the menu-open class from the parent
                    ul.removeClass('menu-open');
                    //Get the parent li
                    var parent_li = $this.parent("li");

                    //Open the target menu and add the menu-open class
                    checkElement.slideDown(animationSpeed, function () {
                        //Add the class active to the parent li
                        checkElement.addClass('menu-open');
                        parent.find('li.active').removeClass('active');
                        parent_li.addClass('active');
                        //Fix the layout in case the sidebar stretches over the height of the window
                        _this.layout.fix();
                    });
                }
                //if this isn't a link, prevent the page from being redirected
                if (checkElement.is('.treeview-menu')) {
                    e.preventDefault();
                }
            });
    };

    /* ControlSidebar
     * ==============
     * Adds functionality to the right sidebar
     *
     * @type Object
     * @usage: $.AALAA.controlSidebar.activate(options)
     */
    $.AALAA.controlSidebar = {
        //instantiate the object
        activate: function () {
            //Get the object
            var _this = this;
            //Update options
            var o = $.AALAA.options.controlSidebarOptions;
            //Get the sidebar
            var sidebar = $(o.selector);
            //The toggle button
            var btn = $(o.toggleBtnSelector);

            //Listen to the click event
            btn.on('click', function (e) {
                e.preventDefault();
                //If the sidebar is not open
                if (!sidebar.hasClass('control-sidebar-open')
                    && !$('body').hasClass('control-sidebar-open')) {
                    //Open the sidebar
                    _this.open(sidebar, o.slide);
                } else {
                    _this.close(sidebar, o.slide);
                }
            });

            //If the body has a boxed layout, fix the sidebar bg position
            var bg = $(".control-sidebar-bg");
            _this._fix(bg);

            //If the body has a fixed layout, make the control sidebar fixed
            if ($('body').hasClass('fixed')) {
                _this._fixForFixed(sidebar);
            } else {
                //If the content height is less than the sidebar's height, force max height
                if ($('.content-wrapper, .right-side').height() < sidebar.height()) {
                    _this._fixForContent(sidebar);
                }
            }
        },
        //Open the control sidebar
        open: function (sidebar, slide) {
            //Slide over content
            if (slide) {
                sidebar.addClass('control-sidebar-open');
            } else {
                //Push the content by adding the open class to the body instead
                //of the sidebar itself
                $('body').addClass('control-sidebar-open');
            }
        },
        //Close the control sidebar
        close: function (sidebar, slide) {
            if (slide) {
                sidebar.removeClass('control-sidebar-open');
            } else {
                $('body').removeClass('control-sidebar-open');
            }
        },
        _fix: function (sidebar) {
            var _this = this;
            if ($("body").hasClass('layout-boxed')) {
                sidebar.css('position', 'absolute');
                sidebar.height($(".wrapper").height());
                if (_this.hasBindedResize) {
                    return;
                }
                $(window).resize(function () {
                    _this._fix(sidebar);
                });
                _this.hasBindedResize = true;
            } else {
                sidebar.css({
                    'position': 'fixed',
                    'height': 'auto'
                });
            }
        },
        _fixForFixed: function (sidebar) {
            sidebar.css({
                'position': 'fixed',
                'max-height': '100%',
                'overflow': 'auto',
                'padding-bottom': '50px'
            });
        },
        _fixForContent: function (sidebar) {
            $(".content-wrapper, .right-side").css('min-height', sidebar.height());
        }
    };

    /* BoxWidget
     * =========
     * BoxWidget is a plugin to handle collapsing and
     * removing boxes from the screen.
     *
     * @type Object
     * @usage: $.AALAA.boxWidget.activate()
     *        Set all your options in the main $.AALAA.options object
     */
    $.AALAA.boxWidget = {
        selectors: $.AALAA.options.boxWidgetOptions.boxWidgetSelectors,
        icons: $.AALAA.options.boxWidgetOptions.boxWidgetIcons,
        animationSpeed: $.AALAA.options.animationSpeed,
        activate: function (_box) {
            var _this = this;
            if (!_box) {
                _box = document; // activate all boxes per default
            }
            //Listen for collapse event triggers
            $(_box).on('click', _this.selectors.collapse, function (e) {
                e.preventDefault();
                _this.collapse($(this));
            });

            //Listen for remove event triggers
            $(_box).on('click', _this.selectors.remove, function (e) {
                e.preventDefault();
                _this.remove($(this));
            });
        },
        collapse: function (element) {
            var _this = this;
            //Find the box parent
            var box = element.parents(".box").first();
            //Find the body and the footer
            var box_content = box.find("> .box-body, > .box-footer, > form  >.box-body, > form > .box-footer");
            if (!box.hasClass("collapsed-box")) {
                //Convert minus into plus
                element.children(":first")
                    .removeClass(_this.icons.collapse)
                    .addClass(_this.icons.open);
                //Hide the content
                box_content.slideUp(_this.animationSpeed, function () {
                    box.addClass("collapsed-box");
                });
            } else {
                //Convert plus into minus
                element.children(":first")
                    .removeClass(_this.icons.open)
                    .addClass(_this.icons.collapse);
                //Show the content
                box_content.slideDown(_this.animationSpeed, function () {
                    box.removeClass("collapsed-box");
                });
            }
        },
        remove: function (element) {
            //Find the box parent
            var box = element.parents(".box").first();
            box.slideUp(this.animationSpeed);
        }
    };
}
/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Custom Plugins
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Description : All custom plugins are defined below.
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
/*
 * BOX REFRESH BUTTON
 * ------------------
 * This is a custom plugin to use with the component BOX. It allows you to add
 * a refresh button to the box. It converts the box's state to a loading state.
 *
 * @type plugin
 * @usage: $("#box-widget").boxRefresh( options );
 */
(function ($) {
    "use strict";
    $.fn.boxRefresh = function (options) {
        // Render options
        var settings = $.extend({
            //Refresh button selector
            trigger: ".refresh-btn",
            //File source to be loaded (e.g: ajax/src.php)
            source: "",
            //Callbacks
            onLoadStart: function (box) {
                return box;
            }, //Right after the button has been clicked
            onLoadDone: function (box) {
                return box;
            }   //When the source has been loaded
        }, options);
        //The overlay
        var overlay = $('<div class="overlay"><div class="fa fa-refresh fa-spin"></div></div>');
        return this.each(function () {
            //if a source is specified
            if (settings.source === "") {
                if (window.console) {
                    println("Please specify a source first - boxRefresh()");
                }
                return;
            }
            //the box
            var box = $(this);
            //the button
            var rBtn = box.find(settings.trigger).first();
            //On trigger click
            rBtn.on('click', function (e) {
                e.preventDefault();
                //Add loading overlay
                start(box);

                //Perform ajax call
                box.find(".box-body").load(settings.source, function () {
                    done(box);
                });
            });
        });
        function start(box) {
            //Add overlay and loading img
            box.append(overlay);
            settings.onLoadStart.call(box);
        }
        function done(box) {
            //Remove overlay and loading img
            box.find(overlay).remove();
            settings.onLoadDone.call(box);
        }
    };
})(jQuery);

/*
 * --------------------------------------------------------------------------------------------
 * EXPLICIT BOX CONTROLS
 * --------------------------------------------------------------------------------------------
 * This is a custom plugin to use with the component BOX. It allows you to activate
 * a box inserted in the DOM after the AALAA.js was loaded, toggle and remove box.
 * --------------------------------------------------------------------------------------------
 * @type plugin
 * @usage: $("#box-widget").activateBox();
 * @usage: $("#box-widget").toggleBox();
 * @usage: $("#box-widget").removeBox();
 * --------------------------------------------------------------------------------------------
 */
(function ($) {
    'use strict';
    $.fn.activateBox = function () {
        $.AALAA.boxWidget.activate(this);
    };
    $.fn.toggleBox = function () {
        var button = $($.AALAA.boxWidget.selectors.collapse, this);
        $.AALAA.boxWidget.collapse(button);
    };
    $.fn.removeBox = function () {
        var button = $($.AALAA.boxWidget.selectors.remove, this);
        $.AALAA.boxWidget.remove(button);
    };
})(jQuery);

/*
 * TODO LIST CUSTOM PLUGIN
 * -----------------------
 * This plugin depends on iCheck plugin for checkbox and radio inputs
 *
 * @type plugin
 * @usage: $("#todo-widget").toDoList( options );
 */
(function ($) {

    'use strict';

    $.fn.toDoList = function (options) {
        // Render options
        var settings = $.extend({
            //When the user checks the input
            onCheck: function (ele) {
                return ele;
            },
            //When the user unchecks the input
            onUncheck: function (ele) {
                return ele;
            }
        }, options);

        return this.each(function () {
            if (typeof $.fn.iCheck != 'undefined') {
                $('input', this).on('ifChecked', function () {
                    var ele = $(this).parents("li").first();
                    ele.toggleClass("done");
                    settings.onCheck.call(ele);
                });

                $('input', this).on('ifUnchecked', function () {
                    var ele = $(this).parents("li").first();
                    ele.toggleClass("done");
                    settings.onUncheck.call(ele);
                });
            }
            else {
                $('input', this).on('change', function () {
                    var ele = $(this).parents("li").first();
                    ele.toggleClass("done");
                    if ($('input', ele).is(":checked")) {
                        settings.onCheck.call(ele);
                    } else {
                        settings.onUncheck.call(ele);
                    }
                });
            }
        });
    };
}(jQuery));
//======================================================================================================================================================
/*
* Usage:
*   var array = [1,1,2,3,8,2];
*   print(array.unique());
*   result : [1, 2, 3, 8]
*/
/*Array.prototype.unique = function(){
    var array = this;
    return array.filter(function(ele, index, arr){
        return index == arr.indexOf(ele);
    });
}*/
Array.prototype.unique = function(){
    var array = this;
    return $.grep(array, function(ele, index){
        return $.inArray(ele, array) === index;
    });
};
function sortArrays(Array) {
    Array.sort(function (a, b) {
        var a1 = a.code, b1 = b.code;
        if (a1 == b1) return 0;
        return a1 > b1 ? 1 : -1;
    });
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  Selecting a random item from a list                                                                                                         */
/**------------------------------------------------------------------------------------------------------------------------------------------------------
 *  @type plugin
 *  @usage:
 *  var luckyDraw = ["Colin", "John", "James", "Lily", "Mary"];
 *  pickRandom(luckyDraw);  // John
 **------------------------------------------------------------------------------------------------------------------------------------------------------*/
function pickRandom(arr){
    var index = Math.floor(Math.random() * (arr.length));
    return arr[index];
}
/*------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*  Removing properties from object                                                                                                                     */
/**-----------------------------------------------------------------------------------------------------------------------------------------------------*/
 String.prototype.toNativeNumber = function () {
    let string = this, locale = userLocal.toUpperCase();
    if (string && locale.toUpperCase() != "EN"){
        string = toNativeNumber(string)
    }
    return string;
}
//======================================================================================================================================================
/**
 * --------------------------------------------------------------------------------------------
 * CUSTOM STATIC PLUGIN
 * --------------------------------------------------------------------------------------------
 * @type plugin
 * @usage: $.getRandomNumber(15, 20);
 * --------------------------------------------------------------------------------------------
 **/
$.AALAA.utilities = {
    print                   : function (String) {
        console.log(String);
    },
    println                 : function (String) {
        console.log("\n" + String);
    },
    isUrlContains           : function (URL) {
        var result = false;
        if (window.location.href.indexOf(URL) != -1) result = true;
        return result;
    },
    getUrlParameter         : function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
        return false;
    },
    getObjectLength         : function(o) {
        return Object.keys(o).length;
    },
    getObjectDetails        : function (o) {  //todo : convert Object to json, after that > getStringFromJson(o)
        var r = "";
        $.each(o, function (k, v) {
            r += (k + '  :  ' + v + '\n');
        });
        return r;
    },
    getStringFromJson       : function (o) {
        return JSON.stringify(o);
    },
    getJsonFromString       : function (s) {
        return jQuery.parseJSON(s);
    },
    getFileName             : function (path) {
        return path.match(/[-_\w]+[.][\w]+$/i)[0];
    },
    getNumberFromString     : function (string) {
        return string.replace(/\D/g, '');
    },
    setToLocalStorage       : function (key, value) {
        if (typeof(Storage) !== "undefined") {
            localStorage.setItem(key, value);
        } else {
            //window.alert('Please use a modern browser to properly view this template...!');
            aalaaAlert({type: "MESSAGE", content: "Please use a modern browser to properly view this template...!"});
            print("Sorry! Your device does'nt support Web Storage. Please update your browser");
        }
    },
    setToSessionStorage     : function (key, value) {
        if (typeof(Storage) !== "undefined") {
            sessionStorage.setItem(key, value);
        } else {
            //window.alert('Please use a modern browser to properly view this template!');
            aalaaAlert({type: "MESSAGE", content: "Please use a modern browser to properly view this template...!"});
            print("Sorry! Your device does'nt support Web Storage. Please update your browser.");
        }
    },
    getFromLocalStorage     : function (key) {
        if (typeof (Storage) !== "undefined") {
            return localStorage.getItem(key);
        } else {
            //window.alert('Please use a modern browser to properly view this template!');
            aalaaAlert({type: "MESSAGE", content: "Please use a modern browser to properly view this template...!"});
            print("Sorry! Your device does'nt support Web Storage. Please update your browser");
        }
    },
    getFromSessionStorage   : function (key) {
        if (typeof(Storage) !== "undefined") {
            return sessionStorage.getItem(key);
        } else {
            //window.alert('Please use a modern browser to properly view this template!');
            aalaaAlert({type: "MESSAGE", content: "Please use a modern browser to properly view this template...!"});
            print("Sorry! Your device does'nt support Web Storage. Please update your browser");
        }
    },
    removeFromLocalStorage  : function (key) {
        localStorage.setItem(key, null);
    },
    removeFromSessionStorage: function (key) {
        sessionStorage.setItem(key, null);
    },
    setCookie               : function (key, value, expireAfterMills) {
        var expires;
        if (expireAfterMills) {
            var expires = new Date();
            //expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
            expires.setTime(expires.getTime() + (expireAfterMills));
        }
        document.cookie = key + '=' + value + ';expires=' + expires;//.toUTCString();
    },
    getCookie               : function (key) {
        var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    },
    setMenuType             : function (menuType) {
        var menuType = menuType ? menuType : "LEFT";
        try {
            menuType = setToLocalStorage("MENU_TYPE", "LEFT");
        }
        catch (exception) {
            println(exception);
        }
    },
    getMenuType             : function () {
        var menuType = "LEFT";
        try {
            menuType = getFromLocalStorage("MENU_TYPE");
        }
        catch (exception) {
            menuType = setToLocalStorage("MENU_TYPE", "LEFT");
        }
        return menuType;
    },
    getRandomNumber         : function getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
};
$.extend($.AALAA.utilities);
/**
 * --------------------------------------------------------------------------------------------
 * CUSTOM PLUGIN
 * --------------------------------------------------------------------------------------------
 * This is a custom plugin to validate required fields. It allows you to prevent from submission
 * of a form without putting any value.
 * --------------------------------------------------------------------------------------------
 * @type plugin
 * @usage: $(".rf").validateRequiredFields();
 * @usage: $.getRandomNumber(15, 20);
 * @usage: $("#input").onPressEnter(function () {alert('Enter...!');});
 * @usage: of copyProperty
 *         var objA = {"name": "colin", "car": "suzuki", "age": 17};
 *         var objB = objA.pick(['car', 'age']); //{"car": "suzuki", "age": 17}
 * --------------------------------------------------------------------------------------------
 **/
(function ($) {
    'use strict';
    $.fn.onPressEnter           = function (f) {
        return this.each(function () {
            $(this).keypress(function (e) {
                var keyCode = (e.keyCode ? e.keyCode : e.which);
                if (keyCode == '13') {
                    f.call(this, e);
                }
            });
        });
    };
    $.fn.validateRequiredFields = function () {
        var isValid = true;
        $(this).each(function () {
            if (!$(this).val()){
                $(this).parent().addClass("has-error");
                isValid = false;
            }
            else {
                $(this).parent().removeClass("has-error");
            }
        });
        return isValid;
    };
    $.fn.removeDatePicker = function () {
        var isRemoved = true;
        //$("#attendanceDate").removeClass("dtp-date").addClass("dtp-date-time").datepicker('remove');
        try {
            $(this).datepicker('remove');
        } catch (e) {
            isRemoved = false;
        }
        return isRemoved;
    };
    $.fn.removeDateTimePicker = function () {
        var isRemoved = true;
        //$("#attendanceDateX").removeClass("dtp-date-time").addClass("dtp-date").data('DateTimePicker').destroy();
        try {
            $(this).data('DateTimePicker').destroy();
        } catch (e) {
            isRemoved = false;
        }
        return isRemoved;
    };
    $.fn.throwError             = function (message) {
        $(this).parent().addClass("has-error").find(".error-message").remove();
        if(message)$(this).after("<label class='error-message'>" + message + "</label>");
    };
    $.fn.removeError            = function () {
        $(this).parent().removeClass("has-error").find(".error-message").remove();
    };
    $.fn.copyProperty           = function(arr) {
        var _this = this;
        var obj = {};
        arr.forEach(function(key){
            obj[key] = _this[key];
        });
        return obj;
    };
    $.fn.getObjectLengthX        = function() {
        return Object.keys(this).length;
    };
})(jQuery);
//======================================================================================================================================================
function findByKey(object, key){
    return Object.fromEntries(Object.entries(object).filter(([k, v]) => k === key))[key];
}
//======================================================================================================================================================
//      Pivot Table
//======================================================================================================================================================
/**
 *@input: dataSet
 var dataSet = {
        "columns": [ "SL", "KEYWORD", "TITLE", "TITLE_NATIVE", "TOTAL" ],
        "values" : [
           [ "1", "FIRE"         , "Fire"         , "Fire"         , "96" ],
           [ "2", "MOTOR"        , "Motor"        , "Motor"        ,  "0" ],
           [ "3", "ENGINEERING"  , "Engineering"  , "Engineering"  ,  "0" ],
           [ "4", "MARINE_CARGO" , "Marine Cargo" , "Marine Cargo" ,  "5" ],
           [ "5", "MARINE_HULL"  , "Marine Hull"  , "Marine Hull"  ,  "0" ],
           [ "6", "MISCELLANEOUS", "Miscellaneous", "Miscellaneous",  "0" ]
        ]
     }
 *
 *@Output: {
        "SL"          : [ "1", "2", "3", "4", "5", "6" ],
        "KEYWORD"     : [ "FIRE", "MOTOR", "ENGINEERING", "MARINE_CARGO", "MARINE_HULL", "MISCELLANEOUS" ],
        "TITLE"       : [ "Fire", "Motor", "Engineering", "Marine Cargo", "Marine Hull", "Miscellaneous" ],
        "TITLE_NATIVE": [ "Fire", "Motor", "Engineering", "Marine Cargo", "Marine Hull", "Miscellaneous" ],
        "TOTAL"       : [ "96", "0", "0", "5", "0", "0" ]
     }
 **/
function generatePivotTable(ds) {
    var table = {};
    $.each(ds.columns , function(i, v) {
        table[v] = getColumnValues(i, ds.values)
    });
    return table;
}

function getColumnValues(i, ds) {
    var values = [];
    $.each(ds, function(j, v) {
        values.push(v[i]);
    });
    return values;
}

function pivot(object) {
    const keys = Object.keys(object);
    let pivotObject = [];
    for (let v = 0; v < object[keys[0]].length; v++) {
        let instance = {};
        for (let k = 0; k < keys.length; k++) {
            let key = keys[k];
            instance[key] = object[key][v];
        }
        pivotObject.push(instance);
    }
    return pivotObject;
}
//======================================================================================================================================================

function getLocalWiseValue(value, valueNative) {
    let r = "", locale = userLocal.toUpperCase();
    if(!value && valueNative){
        r = value = valueNative;
    }
    if(value && !valueNative){
        r = valueNative = value;
    }
    try{
        r = locale != "EN" ? valueNative : value
    }
    catch (e) {}
    return r;
}

function toNativeNumber(s) {
    if(s){
        s = s.replaceAll("0", "০");
        s = s.replaceAll("1", "১");
        s = s.replaceAll("2", "২");
        s = s.replaceAll("3", "৩");
        s = s.replaceAll("4", "৪");
        s = s.replaceAll("5", "৫");
        s = s.replaceAll("6", "৬");
        s = s.replaceAll("7", "৭");
        s = s.replaceAll("8", "৮");
        s = s.replaceAll("9", "৯");
    }
    return s;
}
//======================================================================================================================================================
