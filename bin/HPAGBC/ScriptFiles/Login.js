$(function () {
    $.each($.browser, function (i) {
        if (!$.browser.msie) {
            if (navigator.appName == 'Netscape') {
                var ua = navigator.userAgent; var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");  //for IE 11
                if (re.exec(ua) != null) { rv = parseFloat(RegExp.$1); }
                else { location.href = "noauthority.htm"; }
            } else
            { location.href = "noauthority.htm"; }

        }
    });
});


