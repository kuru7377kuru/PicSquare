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

 });