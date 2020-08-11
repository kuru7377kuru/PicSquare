$(function() {
  $("h1").css("color", "green");
  
  var duration = 300;
  $('.post').on("mouseover", function() {
    $(this).find('.po').stop(true).animate({
      bottom: "0px"
    },duration)
  });

  $('.post').on("mouseout", function() {
    $(this).find('.po').stop(true).animate({
      bottom: "-25%"
    },duration)
  });

  $('#masonry-container').masonry({
    itemSelector: '.box',
    columnWidth: 10,
    gutterWidth: 10
  });

  $('.slide').on("mouseover", function() {
    $(this).find('.po').stop(true).animate({
      bottom: "0px"
    },duration)
  });

  $('.slide').on("mouseout", function() {
    $(this).find('.po').stop(true).animate({
      bottom: "-25%"
    },duration)
  });

  
    $('.slideshow-slides').slick({
      dots: true,
      infinite: true,
      speed: 300,
      slidesToShow: 1,
      centerMode: true,
      variableWidth: true,
      autoplay: true,
      autoplaySpeed: 4000,
    });

  $('.header').each(function() {
    var $window = $(window),
        $header = $(this),
        headerOffsetTop = $header.offset().top;

  });
});

 