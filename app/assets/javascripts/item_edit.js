$(document).on('turbolinks:load', ()=>{
  const buildFileField = (num)=>{
    const html = `<div data-index="${num}" class="js-file_group">
                    <label class='js-file_label' for='item_images_attributes_${num}_image'>
                      <p class="js-add">画像追加</p>
                      <input class='js-file-hidden' type="file" name="item[images_attributes][${num}][image]" id="item_images_attributes_${num}_image">
                    </label>
                    <div class="js-remove">削除</div>
                  </div>`;
      return html;
  }
  // プレビュー用のimageタグ
  const buildImg = (index, url)=>{
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10]; 
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('.image-box').on('change', '.js-file-hidden', function(e){
    const targetIndex = $(this).parent().parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {
      $('.image-box--previews').append(buildImg(targetIndex, blobUrl));
      $('.image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1]+ 1)
    }
  });

  $('.image-box').on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if($('.js-file-hidden').length == 0) $('.image-box').append(buildFileField(fileIndex[0]));
  });
  
});





