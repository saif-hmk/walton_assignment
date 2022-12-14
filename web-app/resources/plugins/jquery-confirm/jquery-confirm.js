/*!
 * jquery-confirm v2.5.1 (http://craftpip.github.io/jquery-confirm/)
 * Author: Boniface Pereira
 * Website: www.craftpip.com
 * Contact: hey@craftpip.com
 *
 * Copyright 2013-2015 jquery-confirm
 * Licensed under MIT (https://github.com/craftpip/jquery-confirm/blob/master/LICENSE)
 */
if (typeof jQuery === "undefined") {
    throw new Error("jquery-confirm requires jQuery");
}
var jconfirm, Jconfirm;
(function ($) {
    $.fn.confirm = function (options, option2) {
        if (typeof options === "undefined") {
            options = {};
        }
        if (typeof options === "string") {
            options = {content: options, title: (option2) ? option2 : false};
        }
        $(this).each(function () {
            var $this = $(this);
            $this.on("click", function (e) {
                e.preventDefault();
                var jcOption = $.extend({}, options);
                if ($this.attr("data-title")) {
                    jcOption.title = $this.attr("data-title");
                }
                if ($this.attr("data-content")) {
                    jcOption.content = $this.attr("data-content");
                }
                jcOption["$target"] = $this;
                if ($this.attr("href") && !options.confirm) {
                    jcOption.confirm = function () {
                        location.href = $this.attr("href");
                    };
                }
                $.confirm(jcOption);
            });
        });
        return $(this);
    };
    $.confirm = function (options, option2) {
        if (typeof options === "undefined") {
            options = {};
        }
        if (typeof options === "string") {
            options = {content: options, title: (option2) ? option2 : false};
        }
        return jconfirm(options);
    };
    $.alert = function (options, option2) {
        if (typeof options === "undefined") {
            options = {};
        }
        if (typeof options === "string") {
            options = {content: options, title: (option2) ? option2 : false};
        }
        options.cancelButton = false;
        return jconfirm(options);
    };
    $.dialog = function (options, option2) {
        if (typeof options === "undefined") {
            options = {};
        }
        if (typeof options === "string") {
            options = {content: options, title: (option2) ? option2 : false};
        }
        options.cancelButton = false;
        options.confirmButton = false;
        options.confirmKeys = [13];
        return jconfirm(options);
    };
    jconfirm = function (options) {
        if (typeof options === "undefined") {
            options = {};
        }
        if (jconfirm.defaults) {
            $.extend(jconfirm.pluginDefaults, jconfirm.defaults);
        }
        var options = $.extend({}, jconfirm.pluginDefaults, options);
        return new Jconfirm(options);
    };
    Jconfirm = function (options) {
        $.extend(this, options);
        this._init();
    };
    Jconfirm.prototype = {
        _init: function () {
            var that = this;
            this._rand = Math.round(Math.random() * 99999);
            this._buildHTML();
            this._bindEvents();
            setTimeout(function () {
                that.open();
                that._watchContent();
            }, 0);
        }, _buildHTML: function () {
            var that = this;
            this.animation = "anim-" + this.animation.toLowerCase();
            this.closeAnimation = "anim-" + this.closeAnimation.toLowerCase();
            this.theme = "jconfirm-" + this.theme.toLowerCase();
            if (this.animation == "anim-none") {
                this.animationSpeed = 0;
            }
            this._lastFocused = $("body").find(":focus");
            this.$el = $(this.template).appendTo(this.container).addClass(this.theme);
            this.$el.find(".jconfirm-box-container").addClass(this.columnClass);
            this.$el.find(".jconfirm-bg").css(this._getCSS(this.animationSpeed, 1));
            this.$el.find(".jconfirm-bg").css("opacity", this.opacity);
            this.$b = this.$el.find(".jconfirm-box").css(this._getCSS(this.animationSpeed, this.animationBounce)).addClass(this.animation);
            this.$body = this.$b;
            if (this.rtl) {
                this.$el.addClass("rtl");
            }
            this._contentReady = $.Deferred();
            this._modalReady = $.Deferred();
            this.$title = this.$el.find(".title");
            this.contentDiv = this.$el.find("div.content");
            this.$content = this.contentDiv;
            this.$contentPane = this.$el.find(".content-pane");
            this.$icon = this.$el.find(".icon-c");
            this.$closeIcon = this.$el.find(".closeIcon");
            this.$contentPane.css(this._getCSS(this.animationSpeed, 1));
            this.setTitle();
            this.setIcon();
            this._setButtons();
            if (this.closeIconClass) {
                this.$closeIcon.html('<i class="' + this.closeIconClass + '"></i>');
            }
            that._contentHash = this._hash(that.$content.html());
            $.when(this._contentReady, this._modalReady).then(function () {
                that.setContent();
                that.setTitle();
                that.setIcon();
            });
            this._getContent();
            this._imagesLoaded();
            if (this.autoClose) {
                this._startCountDown();
            }
        }, _unwatchContent: function () {
            clearInterval(this._timer);
        }, _hash: function () {
            return btoa((encodeURIComponent(this.$content.html())));
        }, _watchContent: function () {
            var that = this;
            this._timer = setInterval(function () {
                var now = that._hash(that.$content.html());
                if (that._contentHash != now) {
                    that._contentHash = now;
                    that.setDialogCenter();
                    that._imagesLoaded();
                }
            }, this.watchInterval);
        }, _bindEvents: function () {
            var that = this;
            var boxClicked = false;
            this.$el.find(".jconfirm-scrollpane").click(function (e) {
                if (!boxClicked) {
                    if (that.backgroundDismiss) {
                        that.cancel();
                        that.close();
                    } else {
                        that.$b.addClass("hilight");
                        setTimeout(function () {
                            that.$b.removeClass("hilight");
                        }, 800);
                    }
                }
                boxClicked = false;
            });
            this.$el.find(".jconfirm-box").click(function (e) {
                boxClicked = true;
            });
            if (this.$confirmButton) {
                this.$confirmButton.click(function (e) {
                    e.preventDefault();
                    var r = that.confirm(that.$b);
                    that._stopCountDown();
                    that.onAction("confirm");
                    if (typeof r === "undefined" || r) {
                        that.close();
                    }
                });
            }
            if (this.$cancelButton) {
                this.$cancelButton.click(function (e) {
                    e.preventDefault();
                    var r = that.cancel(that.$b);
                    that._stopCountDown();
                    that.onAction("cancel");
                    if (typeof r === "undefined" || r) {
                        that.close();
                    }
                });
            }
            if (this.$closeButton) {
                this.$closeButton.click(function (e) {
                    e.preventDefault();
                    that._stopCountDown();
                    that.cancel();
                    that.onAction("close");
                    that.close();
                });
            }
            if (this.keyboardEnabled) {
                setTimeout(function () {
                    $(window).on("keyup." + this._rand, function (e) {
                        that.reactOnKey(e);
                    });
                }, 500);
            }
            $(window).on("resize." + this._rand, function () {
                that.setDialogCenter(true);
            });
        }, _getCSS: function (speed, bounce) {
            return {"-webkit-transition-duration": speed / 1000 + "s", "transition-duration": speed / 1000 + "s", "-webkit-transition-timing-function": "cubic-bezier(.36,1.1,.2, " + bounce + ")", "transition-timing-function": "cubic-bezier(.36,1.1,.2, " + bounce + ")"};
        }, _imagesLoaded: function () {
            var that = this;
            $.each(this.$content.find("img:not(.loaded)"), function (i, a) {
                var interval = setInterval(function () {
                    var h = $(a).css("height");
                    if (h !== "0px") {
                        $(a).addClass("loaded");
                        that.setDialogCenter();
                        clearInterval(interval);
                    }
                }, 40);
            });
        }, _setButtons: function () {
            this.$btnc = this.$el.find(".buttons");
            if (this.confirmButton && $.trim(this.confirmButton) !== "") {
                this.$confirmButton = $('<button type="button" class="btn">' + this.confirmButton + "</button>").appendTo(this.$btnc).addClass(this.confirmButtonClass);
            }
            if (this.cancelButton && $.trim(this.cancelButton) !== "") {
                this.$cancelButton = $('<button type="button" class="btn">' + this.cancelButton + "</button>").appendTo(this.$btnc).addClass(this.cancelButtonClass);
            }
            if (!this.confirmButton && !this.cancelButton) {
                this.$btnc.hide();
            }
            if (!this.confirmButton && !this.cancelButton && this.closeIcon === null) {
                this.$closeButton = this.$b.find(".closeIcon").show();
            }
            if (this.closeIcon === true) {
                this.$closeButton = this.$b.find(".closeIcon").show();
            }
        }, setTitle: function (string) {
            this.title = (typeof string !== "undefined") ? string : this.title;
            this.$title.html(this.title || "");
        }, setIcon: function (iconClass) {
            this.title = (typeof string !== "undefined") ? iconClass : this.title;
            this.$icon.html(this.icon ? '<i class="' + this.icon + '"></i>' : "");
        }, setContent: function (string) {
            var that = this;
            this.content = (typeof string == "undefined") ? this.content : string;
            if (this.content == "") {
                this.$content.html(this.content);
                this.$contentPane.hide();
            } else {
                this.$content.html(this.content);
                this.$contentPane.show();
            }
            if (this.$content.hasClass("loading")) {
                this.$content.removeClass("loading");
                this.$btnc.find("button").prop("disabled", false);
            }
        }, _getContent: function (string) {
            var that = this;
            string = (string) ? string : this.content;
            this._isAjax = false;
            if (!this.content) {
                this.content = "";
                this.setContent(this.content);
                this._contentReady.reject();
            } else {
                if (typeof this.content === "string") {
                    if (this.content.substr(0, 4).toLowerCase() === "url:") {
                        this._isAjax = true;
                        this.$content.addClass("loading");
                        this.$btnc.find("button").prop("disabled", true);
                        var url = this.content.substring(4, this.content.length);
                        $.get(url).done(function (html) {
                            that.content = html;
                            that._contentReady.resolve();
                        }).always(function (data, status, xhr) {
                            if (typeof that.contentLoaded === "function") {
                                that.contentLoaded(data, status, xhr);
                            }
                        });
                    } else {
                        this.setContent(this.content);
                        this._contentReady.reject();
                    }
                } else {
                    if (typeof this.content === "function") {
                        this.$content.addClass("loading");
                        this.$btnc.find("button").attr("disabled", "disabled");
                        var promise = this.content(this);
                        if (typeof promise !== "object") {
                            console.error("The content function must return jquery promise.");
                        } else {
                            if (typeof promise.always !== "function") {
                                console.error("The object returned is not a jquery promise.");
                            } else {
                                this._isAjax = true;
                                promise.always(function (data, status) {
                                    that._contentReady.resolve();
                                });
                            }
                        }
                    } else {
                        console.error("Invalid option for property content, passed: " + typeof this.content);
                    }
                }
            }
            this.setDialogCenter();
        }, _stopCountDown: function () {
            clearInterval(this.timerInterval);
            if (this.$cd) {
                this.$cd.remove();
            }
        }, _startCountDown: function () {
            //original
            /*
            var opt = this.autoClose.split("|");
            if (/cancel/.test(opt[0]) && this.type === "alert") {
                return false;
            }
            else {
                if (/confirm|cancel/.test(opt[0])) {
                    this.$cd = $('<span class="countdown">').appendTo(this["$" + opt[0] + "Button"]);
                    var that = this;
                    that.$cd.parent().click();
                    var time = opt[1] / 1000;
                    this.timerInterval = setInterval(function () {
                        that.$cd.html(" (" + (time -= 1) + ")");
                        if (time === 0) {
                            that.$cd.html("");
                            that.$cd.parent().trigger("click");
                            clearInterval(that.timerInterval);
                        }
                    }, 1000);
                } else {
                    console.error("Invalid option " + opt[0] + ", must be confirm/cancel");
                }
            }
            */




            //added by SAIF
            var ac = this.autoClose;
            // alert(parseInt(ac) > 0);
            // alert(typeof ac);
            // alert(ac.indexOf("|") <= 0);
            if((ac.indexOf("|") <= 0) && parseInt(ac) > 0){
                var that = this;
                var time = parseInt(ac) / 1000;
                this.timerInterval = setInterval(function () {
                    time -= 1;
                    if (time === 0) {
                        $(".jconfirm").remove();
                        clearInterval(that.timerInterval);
                    }
                }, 1000);
            }
            else{
                var opt = this.autoClose.split("|");
                if (/cancel/.test(opt[0]) && this.type === "alert") {
                    return false;
                }
                else {
                    if (/confirm|cancel/.test(opt[0])) {
                        this.$cd = $('<span class="countdown">').appendTo(this["$" + opt[0] + "Button"]);
                        var that = this;
                        that.$cd.parent().click();
                        var time = opt[1] / 1000;
                        this.timerInterval = setInterval(function () {
                            that.$cd.html(" (" + (time -= 1) + ")");
                            if (time === 0) {
                                that.$cd.html("");
                                that.$cd.parent().trigger("click");
                                clearInterval(that.timerInterval);
                            }
                        }, 1000);
                    } else {
                        console.error("Invalid option " + opt[0] + ", must be confirm/cancel");
                    }
                }
            }
        }, reactOnKey: function key(e) {
            var a = $(".jconfirm");
            if (a.eq(a.length - 1)[0] !== this.$el[0]) {
                return false;
            }
            var key = e.which;
            if (this.contentDiv.find(":input").is(":focus") && /13|32/.test(key)) {
                return false;
            }
            if ($.inArray(key, this.cancelKeys) !== -1) {
                if (this.$cancelButton) {
                    this.$cancelButton.click();
                } else {
                    this.close();
                }
            }
            if ($.inArray(key, this.confirmKeys) !== -1) {
                if (this.$confirmButton) {
                    this.$confirmButton.click();
                }
            }
        }, setDialogCenter: function () {
            if (this.$contentPane.css("display") == "none") {
                var contentHeight = 0;
                var paneHeight = 0;
            } else {
                var contentHeight = this.$content.outerHeight();
                var paneHeight = this.$contentPane.height();
                if (paneHeight == 0) {
                    paneHeight = contentHeight;
                }
            }
            var off = 100;
            var w = this.$content.outerWidth();
            this.$content.css({clip: "rect(0px " + (off + w) + "px " + contentHeight + "px -" + off + "px)"});
            this.$contentPane.css({height: contentHeight});
            var windowHeight = $(window).height();
            var boxHeight = this.$b.outerHeight() - paneHeight + contentHeight;
            var topMargin = (windowHeight - boxHeight) / 2;
            var minMargin = 100;
            if (boxHeight > (windowHeight - minMargin)) {
                var style = {"margin-top": minMargin / 2, "margin-bottom": minMargin / 2};
                $("body").addClass("jconfirm-noscroll");
            } else {
                var style = {"margin-top": topMargin};
                $("body").removeClass("jconfirm-noscroll");
            }
            this.$b.css(style);
        }, close: function () {
            var that = this;
            if (this.isClosed()) {
                return false;
            }
            if (typeof this.onClose === "function") {
                this.onClose();
            }
            this._unwatchContent();
            that._lastFocused.focus();
            $(window).unbind("resize." + this._rand);
            if (this.keyboardEnabled) {
                $(window).unbind("keyup." + this._rand);
            }
            that.$el.find(".jconfirm-bg").removeClass("seen");
            $("body").removeClass("jconfirm-noscroll");
            this.$b.addClass(this.closeAnimation);
            var closeTimer = (this.closeAnimation == "anim-none") ? 0 : this.animationSpeed;
            setTimeout(function () {
                that.$el.remove();
            }, closeTimer * 25 / 100);
            jconfirm.record.closed += 1;
            jconfirm.record.currentlyOpen -= 1;
            return true;
        }, open: function () {
            var that = this;
            if (this.isClosed()) {
                return false;
            }
            that.$el.find(".jconfirm-bg").addClass("seen");
            this.$b.removeClass(this.animation);
            this.$b.find("input[autofocus]:visible:first").focus();
            jconfirm.record.opened += 1;
            jconfirm.record.currentlyOpen += 1;
            if (typeof this.onOpen === "function") {
                this.onOpen();
            }
            var jcr = "jconfirm-box" + this._rand;
            this.$b.attr("aria-labelledby", jcr).attr("tabindex", -1).focus();
            if (this.$title) {
                this.$title.attr("id", jcr);
            } else {
                if (this.$content) {
                    this.$content.attr("id", jcr);
                }
            }
            setTimeout(function () {
                that.$b.css({"transition-property": that.$b.css("transition-property") + ", margin"});
                that._modalReady.resolve();
            }, this.animationSpeed);
            return true;
        }, isClosed: function () {
            return this.$el.css("display") === "";
        }
    };
    jconfirm.pluginDefaults = {
        animation           : "zoom",
        animationBounce     : 1.2,
        animationSpeed      : 500,
        autoClose           : false,
        backgroundDismiss   : false,
        cancelButton        : "Close",
        cancelButtonClass   : "btn-default",
        cancelKeys          : [27],
        closeAnimation      : "scale",
        closeIcon           : null,
        closeIconClass      : false,
        columnClass         : "col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1",
        confirmButton       : "Okay",
        confirmButtonClass  : "btn-default",
        confirmKeys         : [13],
        container           : "body",
        content             : "Are you sure to continue?",
        icon                : "",
        keyboardEnabled     : false,
        opacity             : 0.2,
        rtl                 : false,
        template            : '<div class="jconfirm"><div class="jconfirm-bg"></div><div class="jconfirm-scrollpane"><div class="container"><div class="row"><div class="jconfirm-box-container"><div class="jconfirm-box" role="dialog" aria-labelledby="labelled" tabindex="-1"><div class="closeIcon">&times;</div><div class="title-c"><span class="icon-c"></span><span class="title"></span></div><div class="content-pane"><div class="content"></div></div><div class="buttons"></div><div class="jquery-clear"></div></div></div></div></div></div></div>',
        theme               : "white",
        title               : "Hello",
        watchInterval       : 100,
        contentLoaded       : function () {},
        confirm             : function () {},
        cancel              : function () {},
        onOpen              : function () {},
        onClose             : function () {},
        onAction            : function () {}
    };
    jconfirm.record = {opened: 0, closed: 0, currentlyOpen: 0};
})(jQuery);