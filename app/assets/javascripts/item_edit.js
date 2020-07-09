$(document).on('turbolinks:load', function() {
  $(".js-remove").on("click", function(e) {
    // var parent = '#' + $(this).prev().attr('id')
    // console.log(parent)
    // $(parent).remove();


    var image_id = $(this).parent().attr('data-index')
    // var number = parent.replace(/[^0-9]/g, '');
    var pathname = location.pathname.slice( 0, -4 );
    var path = pathname + 'image_delete';

    console.log(image_id)
    
    $.ajax( {
      type: 'get',
      url: path,
      data: {image_id: image_id},
      dataType: 'json'
    })
    .done(function() {
      console.log('ok');
      document.location.reload();
    });
 
    
    
    // .done(function(like) {
    //   $(".like__click").remove();
    //   likeNoneAdd(like);
    // });
  });
  // $('.like').on("click", '.like__click--none', function(){
  //   var pathname = location.pathname;
  //   var path = pathname + '/likes';
  //   $.ajax( {
  //     type: 'delete',
  //     url: path,
  //     dataType: 'json'
  //   })
  //   .done(function(like) {
  //     $(".like__click--none").remove();
  //     likeAdd(like);
  //   });
  // });
});


// $(document).on('turbolinks:load', ()=> {
//   // 画像用のinputを生成する関数
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input class="js-file" type="file"
//                     name="item[images_attributes][${index}][src]"
//                     id="item_images_attributes_${index}_src"><br>
//                     <div class="js-remove">削除</div>
//                   </div>`;
//     return html;
//   }

//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   lastIndex = $('.js-file_group:last').data('index');
//   fileIndex.splice(0, lastIndex);
//   $('.hidden-destroy').hide();

//   $('#image-box').on('change', '.js-file', function(e) {
//     // fileIndexの先頭の数字を使ってinputを作る
//     $('#image-box').append(buildFileField(fileIndex[0]));
//     fileIndex.shift();
//     // 末尾の数に1足した数を追加する
//     fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//   });

//   $('#image-box').on('click', '.js-remove', function() {
//     $(this).parent().remove();
//     // 画像入力欄が0個にならないようにしておく
//     if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   });
// });

// $(document).on('turbolinks:load', ()=> {
//   $('item_images_attributes_0_image').on('click', '.js-remove',function(){
//     console.log('Hello')
//   });

// });

// $(document).on('turbolinks:load', ()=>{
//   const buildFileField = (num)=>{
//     const html = `<div data-index="${num}" class="js-file_group">
//                     <div class="js-remove">削除</div>
//                   </div>`;
//       return html;
//   }
//   // プレビュー用のimageタグ
//   const buildImg = (index, url)=>{
//     const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">
//                   <div class="js-edit">編集</div>
//                   <div class="js-remove">削除</div>`;
//     return html;
//   }




//   $('.image-box').on('click', '.js-add', function(e){
//     const targetIndex = $(this).parent().data('index')
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);


//     // プレビューに画像を表示 
//     $('.image-box--previews').append(buildImg(targetIndex));

//   });

//   $('.image-box').on('click', '.js-remove', function(){
//     const targetIndex = $(this).parent().data('index');

//     // buildimgを消したいidごと
//     $().remove();



//     if ($('.js-file_label').length == 0) $('.image-box').append(buildFileField(fileIndex[0]));
//   });






  // let fileIndex = [1,2,3,4,5,6,7,8,9,10]; 
  // lastIndex = $('.js-file_group:last').data('index');
  // fileIndex.splice(0, lastIndex);

  // $('.hidden-destroy').hide();

  // $('.image-box').on('change', '.js-file-hidden', function(e){
  //   const targetIndex = $(this).parent().parent().data('index');
  //   const file = e.target.files[0];
  //   const blobUrl = window.URL.createObjectURL(file);

  //   if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
  //     img.setAttribute('image');
  //   } else {
  //     $('.image-box--previews').append(buildImg(targetIndex, blobUrl));
  //     $('.image-box').append(buildFileField(fileIndex[0]));
  //     fileIndex.shift();
  //     fileIndex.push(fileIndex[fileIndex.length - 1]+ 1)
  //   }
  // });

  // $('.image-box').on('click', '.js-remove', function(){
  //   const targetIndex = $(this).parent().data('index');
  //   const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
  //   if (hiddenCheck) hiddenCheck.prop('checked', true);
  //   debugger
  //   $(this).parent().remove();
  //   $(`img[data-index="${targetIndex}"]`).remove();

  //   if($('.js-file-hidde').length == 0) $('.image-box').append(buildFileField(fileIndex[0]));
  // });
  
// });

// $(document).on('turbolinks:load', ()=>{

//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];

//   $('.input-image__file').on('click','.js-remove',function(){
//     $('.input-image__file').remove()
//     $('.input-image__file').append('.input-image__file-field')
//   });

// });