$(function(){
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子
  function appendChidrenBox(insertHTML){
    let childSelectHtml = '';
    childSelectHtml = `<div class='input-category' id= 'children_wrapper'>
                        <div class='input-category__headline new-input-category__headline' id="input_child_category">
                          <select class="input-category__select" id="item_child_category_id" "name=item[category_id]" >
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.new-input-category__headline').append(childSelectHtml);
  }
  // 孫
  function appendGrandchidrenBox(insertHTML){
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='input-category' id= 'grandchildren_wrapper'>
                              <div class='input-category__headline new-input-category__headline' id="input_grandchild_category">
                                <select class="input-category__select" id="item_grandchild_category" name="category_id" >
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('#input_child_category').append(grandchildSelectHtml);
  }
  $('#item_category_id').on('change', function(){
    let parentCategory = document.getElementById('item_category_id').value;
    if (parentCategory != "---"){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.new-input-category__headline').on('change', '#item_child_category_id', function(){
    let childId = $('#item_child_category_id option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
});