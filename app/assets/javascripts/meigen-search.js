$(function(){
  $('.meigen-search-modal').css("display", "none");

  $('a[href="#modal-open"]').on("click", function(){
    $('.meigen-search-modal').fadeIn();
  });
  $('a[href="#modal-close"]').on("click", function(){
    $('.meigen-search-modal').fadeOut();
  });


  var searchObject1 = $(".search-result1");
  var searchObject2 = $(".search-result2");
  var searchObject3 = $(".search-result3");

  function appendMeigenContents(meigen) {
    var html = `<li>
                  <a href="/meigens/${ meigen.id }">
                    <div calss="meigen-search-modal__content__result__list">
                      <div calss="meigen-container__header--information">
                        投稿者：${ meigen.user_name }
                      </div>
                      <div calss="meigen-container__content__right-content__meigen">
                        ${ meigen.content }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject1.append(html);
  }

  function appendMeigenSources(meigen) {
    var html = `<li>
                  <a href="/meigens/${ meigen.id }">
                    <div calss="meigen-search-modal__content__result__list">
                      <div calss="meigen-container__header--information">
                        投稿者：${ meigen.user_name }
                      </div>
                      <div calss="meigen-container__header--information">
                        ${ meigen.source }
                      </div>
                      <div calss="meigen-container__content__right-content__meigen">
                        ${ meigen.content }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject2.append(html);
  }

  function appendMeigenTags(meigen) {
    console.log(meigen);
    var html = `<li>
                  <a href="/meigens/${ meigen.tag_id }">
                    <div calss="meigen-search-modal__content__result__list">
                      <div calss="meigen-container__header--information">
                        投稿者：${ meigen.tag_user_name }
                      </div>
                      <div calss="meigen-container__header--information">
                        ${ meigen.tag }
                      </div>
                      <div calss="meigen-container__content__right-content__meigen">
                        ${ meigen.tag_content }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject3.append(html);
  }

  function appendNoMeigen(meigen) {
    var html = `<li>
                  <div class="meigen-search-modal__content__result__list">
                    ${meigen}
                  </div>
                </li>`
    searchObject1.append(html);
    searchObject2.append(html);
    searchObject3.append(html);
  }

  $('.search-field').on("keyup", function(){
    var input = $('.search-field').val();
    $.ajax({
      type: 'get',
      url: '/meigens/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(meigens) {
      searchObject1.empty();
      searchObject2.empty();
      searchObject3.empty();
      keywords = $('.search-field').val();

      if (keywords.length !== 0) {
        if (meigens.length !== 0) {
          meigens.forEach(function(meigen){
            if (meigen.content) {
              appendMeigenContents(meigen);
            }
            if (meigen.source) {
              appendMeigenSources(meigen);
            }
            if (meigen.tag) {
              appendMeigenTags(meigen);
            }
          });
        }
        else {
          appendNoMeigen("一致する項目はありません");
        }
      }
    })
    .fail(function(){
      alert("検索に失敗しました。");
    })
  });

});
