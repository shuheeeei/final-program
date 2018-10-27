$(function(){
  $('a[href^="#"]').click(function() {
    var speed = 400;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, speed, 'swing');
    return false;
  });
});

$(function(){
  var url = $(".meigen-show-container__content__left__image").attr('id');
  function imageUpdater() {
    $.ajax({
        type: "GET",
        url: url,
        cache: false,
      })
      .done(function(data) {
        var image = $(data).find(".auto-icons");
        console.log(image);
        $(".meigen-show-container__content__left__image").html(image);
      })
      .fail(function() {
        alert("通信エラー");
      });
  };
  if (window.location.href.match(/\meigens\/\d+$/)) {
   setInterval(imageUpdater, 10000);
 }
});

