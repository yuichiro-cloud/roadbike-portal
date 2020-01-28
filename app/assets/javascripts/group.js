$(function(){
  $(".groups__group__label").hover(function(){
    console.log("マウスが重なりました");
    $(this).addClass("#list-add");
    // console.log(this);
  },function(){
    console.log("マウスカーソルが離れました");
    $(this).removeClass("#list-add");
  });
});
