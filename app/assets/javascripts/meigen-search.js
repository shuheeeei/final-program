$(function(){

  $('#modal-open').on("click", function(){
    $('.meigen-search-modal').fadeIn();
    $('.search-field').focus();
  });
  $('#modal-close').on("click", function(){
    $('.meigen-search-modal').fadeOut();
  });


  var searchObject1 = $(".search-result1");
  var searchObject2 = $(".search-result2");
  var searchObject3 = $(".search-result3");

  function appendMeigenContents(meigen) {
    if (meigen.content.length <= 64) {
      var descriptionContent = meigen.content;
    }
    else {
      var descriptionContent = meigen.content.slice(0, 65) + "...";
    }
    var html = `<li>
                  <a href="/meigens/${ meigen.id }">
                    <div class="meigen-search-modal__content__result">
                      <div class="meigen-search-modal__content__result__content">
                        ${ descriptionContent }
                      </div>
                      <div class="meigen-search-modal__content__result__user">
                        投稿者：${ meigen.user_name }
                      </div>
                      <div class="meigen-search-modal__content__result__source">
                        出典：${ meigen.source }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject1.append(html);
  }

  function appendMeigenSources(meigen) {
    if (meigen.source_content.length <= 64) {
      var descriptionContent = meigen.source_content;
    }
    else {
      var descriptionContent = meigen.source_content.slice(0, 65) + "...";
    }
    var html = `<li>
                  <a href="/meigens/${ meigen.source_id }">
                    <div calss="meigen-search-modal__content__result">
                      <div class="meigen-search-modal__content__result__source">
                        出典：${ meigen.source }
                      </div>
                      <div class="meigen-search-modal__content__result__user">
                        投稿者：${ meigen.source_user_name }
                      </div>
                      <div class="meigen-search-modal__content__result__content">
                        ${ descriptionContent }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject2.append(html);
  }

  function appendMeigenTags(meigen) {
    if (meigen.tag_content.length <= 64) {
      var descriptionContent = meigen.tag_content;
    }
    else {
      var descriptionContent = meigen.tag_content.slice(0, 65) + "...";
    }
    var html = `<li>
                  <a href="/meigens/${ meigen.tag_id }">
                    <div calss="meigen-search-modal__content__result">
                      <div class="meigen-search-modal__content__result__user">
                        投稿者：${ meigen.tag_user_name }
                      </div>
                      <div class="meigen-search-modal__content__result__tag">
                        ${ meigen.tag }
                      </div>
                      <div class="meigen-search-modal__content__result__content">
                        ${ descriptionContent }
                      </div>
                    </div>
                  </a>
                </li>`
    searchObject3.append(html);
  }

  function appendNoContents(meigen) {
    var html = `<li>
                  <div class="meigen-search-modal__content__result__list">
                    ${ meigen }
                  </div>
                </li>`
    searchObject1.append(html);
  }

  function appendNoSources(meigen) {
    var html = `<li>
                  <div class="meigen-search-modal__content__result__list">
                    ${ meigen }
                  </div>
                </li>`
    searchObject2.append(html);
  }

  function appendNoTags(meigen) {
    var html = `<li>
                  <div class="meigen-search-modal__content__result__list">
                    ${ meigen }
                  </div>
                </li>`
    searchObject3.append(html);
  }



  $('.search-field').on("keyup", function(){
    var input = $('.search-field').val();
    $.ajax({
      type: 'get',
      url: '/meigens/contentSearch',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(meigens) {
      searchObject1.empty();
      keywords = $('.search-field').val();

      if (keywords.length !== 0) {
        if (meigens.length !== 0) {
          meigens.forEach(function(meigen){
            if (meigen.content !== null) {
              appendMeigenContents(meigen);
            }
          });
        }
        else {
          appendNoContents("一致する投稿はありません");
        }
      };
    })
    .fail(function(){
      alert("検索に失敗しました。");
    })
  });

  $('.search-field').on("keyup", function(){
    var input = $('.search-field').val();
    $.ajax({
      type: 'get',
      url: '/meigens/sourceSearch',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(meigens) {
      searchObject2.empty();
      keywords = $('.search-field').val();

      if (keywords.length !== 0) {
        if (meigens.length !== 0) {
          meigens.forEach(function(meigen){
            if (meigen.content !== null) {
              appendMeigenSources(meigen);
            }
          });
        }
        else {
          appendNoSources("一致する投稿はありません");
        }
      };
    })
    .fail(function(){
      alert("検索に失敗しました。");
    })
  });


  $('.search-field').on("keyup", function(){
    var input = $('.search-field').val();
    $.ajax({
      type: 'get',
      url: '/meigens/tagSearch',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(meigens) {
      searchObject3.empty();
      keywords = $('.search-field').val();

      if (keywords.length !== 0) {
        if (meigens.length !== 0) {
          meigens.forEach(function(meigen){
            if (meigen.content !== null) {
              appendMeigenTags(meigen);
            }
          });
        }
        else {
          appendNoTags("一致する投稿はありません");
        }
      };
    })
    .fail(function(){
      alert("検索に失敗しました。");
    })
  });
});
