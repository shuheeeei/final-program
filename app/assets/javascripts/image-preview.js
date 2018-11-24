$(function(){
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".input-meigen-container__content__left__image__preview");

    if(file.type.indexOf("image") < 0){
      return false;
    }


    reader.onload = (function(file) {
      return function(e) {

        $preview.empty();

        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "meigen-edit-container__content__left-content__preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
