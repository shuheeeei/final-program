$(function(){
  $('div[class = "meigen-container__scene-container"]').css("display", "none");

  var value = 0;
  $(".accordion-btn").on("click", function(){
    $(this).next().slideToggle();
    value += 180;
    $(this).css("transform", `rotate(${value}deg)`);
  });


  $('.meigen-container__content__right-content__meigen').each(function() {
    var $target = $(this);
    var html = $target.html();
    var $clone = $target.clone();
    $clone
      .css({
        display: 'none',
        position : 'absolute',
        overflow : 'visible'
      })
      .width($target.width())
      .height('auto');
    $target.after($clone);
    while((html.length > 0) && ($clone.height() > $target.height())) {
      html = html.substr(0, html.length - 1);
      $clone.html(html + '...');
    }
    $target.html($clone.html());
    $clone.remove();
  });

})
