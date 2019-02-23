$('[href^="#"]').on('click', function (e) {
    e.preventDefault();
    var target = this.hash;
    var navHeight = $('nav').height();
    var offset = $(target).offset().top - navHeight;
    $('html, body').stop().animate({ 'scrollTop':  offset }, 900 );
});
