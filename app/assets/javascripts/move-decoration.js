$(function(){

  $('.js__sideMenuBtn').on('click', function () {
    $('.side-menu').animate({width: 'toggle'}, 300);
  });

  $('.exp-list-item1').on("click", function() {
    $('.exp-list-content1').slideToggle(400);
    var mark1 = $('.exp-list-item1 span').text();
    if (mark1 == "+") {
      $('.exp-list-item1 span').text("-");
    };
    if (mark1 == "-") {
      $('.exp-list-item1 span').text("+");
    };
  });

  $('.exp-list-item2').on("click", function() {
    $('.exp-list-content2').slideToggle(400);
    var mark2 = $('.exp-list-item2 span').text();
    if (mark2 == "+") {
      $('.exp-list-item2 span').text("-");
    };
    if (mark2 == "-") {
      $('.exp-list-item2 span').text("+");
    };
  });

});

