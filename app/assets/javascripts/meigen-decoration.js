$(function(){
  $('div[class = "meigen-container__scene-container"]').css("display", "none");

  var value = 0;
  $(".accordion-btn").on("click", function(){
    var parent = $(this).parent()
    parent.next().slideToggle();
    value += 180;
    $(this).css("transform", `rotate(${value}deg)`);
  });

})