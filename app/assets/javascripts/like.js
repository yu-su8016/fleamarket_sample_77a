$(document).on('turbolinks:load', function() {
  function likeNoneAdd(like) {
    var html =
    ` <a class="like__click--none" data-remote="true" href="/items/1">
        <div class="like__click--none__icon">
          <i class="fas fa-star icons"></i>
        </div>
        <div class="like__click__letter">
          お気に入り
        </div>
      </a>`;
      $(".like").prepend(html);
  }

  function likeAdd(like) {
    var html =
    ` <a class="like__click" data-remote="true" href="/items/1">
        <div class="like__click__icon">
          <i class="fas fa-star icons"></i>
        </div>
        <div class="like__click__letter">
          お気に入り
        </div>
      </a>`;
      $(".like").prepend(html);
  }
  $(".like").on("click", '.like__click', function(e) {
    var pathname = location.pathname;
    var path = pathname + '/likes'
    
    $.ajax( {
      type: 'post',
      url: path,
      dataType: 'json'
    })
    .done(function(like) {
      $(".like__click").remove();
      likeNoneAdd(like);
    });
  });
  $('.like').on("click", '.like__click--none', function(){
    var pathname = location.pathname;
    var path = pathname + '/likes';
    $.ajax( {
      type: 'delete',
      url: path,
      dataType: 'json'
    })
    .done(function(like) {
      $(".like__click--none").remove();
      likeAdd(like);
    });
  });
});
