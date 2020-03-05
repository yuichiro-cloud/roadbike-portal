$(function(){
  function buildImage(index,url){
    var html
    = `<div class="content__form__image__main__box" data-index="${index}"><div class="content__form__image__main__box__pic" data-index="${index}">
    <img data-index="${index}" src="${url}" width="100px" height="100px"></div>
      <div class="content__form__image__main__box__btns">
        <div class="content__form__image__main__box__btns__remove" data-index="${index}">削除</div>
      </div>
      </div>`
        return html;
  }
  var buildForm = (index)=>{
    var html = `<div class="content__form__image__main__label__group" data-index="${index}">
    <input class="file" type="file" name="bike[images_attributes][${index}][src]" id="bike_images_attributes_${index}_src">
    </div>`
    return html;
  };
  $("#image-box").on("change",".file",function(e){
    const targetIndex = $(this).parent().data("index");
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    const labelIndex = targetIndex + 1;
    $(".content__form__image__main").prepend(buildImage(targetIndex, blobUrl)); // 画像のプレビュー用
    $("#image-box").append(buildForm(labelIndex)); //新しいfilefieldにだけlabelが反応するようにする
    $('#label').attr('for', `bike_images_attributes_${labelIndex}_src`);
  });
  $(document).on("click",".content__form__image__main__box__btns__remove",function(){
    const targetIndex = $(this).data("index");
    $(this).parent().parent().remove(); //対応する削除ボタンを親の親ごと消すため
    $(`img[data-index="${targetIndex}"]`).remove(); //img要素を消す記述
    $(`.content__form__image__main__label__group[data-index="${targetIndex}"]`).remove(); //filefieldを消す記述
  })
});