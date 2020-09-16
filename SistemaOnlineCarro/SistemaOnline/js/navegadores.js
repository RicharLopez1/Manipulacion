$(document).ready(function () {

    $("#navigation ul li").removeClass("active");

    var url = window.location.pathname;
    var substr = url.split('/');
    var urlaspx = substr[substr.length - 1];

    $("#navigation ul li a").each(function () {
        if ($(this).text().toLowerCase() == urlaspx.toLowerCase()) {
            $(this).parent().addClass('active');
        }
    });
});
