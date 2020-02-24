$(function(){
  $(".content__bottom__list__box__link").hover(function(){
    $(this).addClass("content__bottom__list__box__link-add");
  },function(){
    $(this).removeClass("content__bottom__list__box__link-add");
  })
});