$(document).on('turbolinks:load', function() {

  $(".topheader-category").hover(function() {
    $(".category-list__parent").removeClass("hide");
  },
  function() {
    $('.category-list__parent--name').css("background-color", "#fff");
    $('.category-list__grandchild--name').remove();
    $('.category-list__children--name').remove();
    $(".category-list__parent").addClass("hide");
  });

  $('.category-list__parent--name').mouseover(function() {
    $('.category-list__parent--name').css("background-color", "#fff");
    $(this).css("background-color", "#3CCACE");
    let id = $(this).attr('id');
    $.ajax({
      url: "/items/header_category",
      type: "GET",
      data: {category_id: id},
      dataType: "JSON"
    })
    .done(function(data){
      $('.category-list__children--name').remove();
      $('.category-list__grandchild--name').remove();
      $.each( data, function(id, value){
        $(".category-list__children").append('<li class="category-list__children--name" id=' + id + '>' + value + '</li>')
      });
    });
  });

  $(document).on('mouseover', '.category-list__children--name', function() {
    $('.category-list__children--name').css("background-color", "#fff");
    $(this).css("background-color", "#9DE4E6");
    let id = $(this).attr('id');
    $.ajax({
      url: "/items/header_category",
      type: "GET",
      data: {category_id: id},
      dataType: "JSON"
    })
    .done(function(data){
      $('.category-list__grandchild--name').remove();
      $.each( data, function(id, value){
        $(".category-list__grandchild").append('<a href="#" class="category-list__grandchild--name" id=' + id + '>' + value + '</a>')
      });
    });
  });

  $(document).on('mouseover', '.category-list__grandchild--name', function() {
    $('.category-list__grandchild--name').css("background-color", "#fff");
    $(this).css("background-color", "#9DE4E6");
  });

});