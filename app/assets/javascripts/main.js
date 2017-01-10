$(function () {
   if ($('.top-alert-container').length > 0){
        var elm = $('.top-alert-container');
        setTimeout(function () {
            elm.addClass('enter-view');
            setTimeout(function () {
                elm.removeClass('enter-view');
            },3000);
        }, 1000);
   }
});