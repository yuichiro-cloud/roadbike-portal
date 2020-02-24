$(function(){
  var buildChat= `<div class="content__group__chat"></div>`
  function buildMessage(chat){
    var html = `<div class="content__group__chat__box">
  <div class="content__group__chat__box__message">
  ${chat.text}
  </div>
  <div class="content__group__chat__box__date">${chat.date}</div>
  </div>`
  return html;
}
  $(".content__group__left__list__box").hover(function(){
    var groupId =$(this).data("num");
    $(".content__group").append(buildChat);
    $.ajax({
      url: 'bikes/chat',
      type: 'GET',
      data: { group_id: groupId },
      dataType: 'json'
    })
    .done(function(chats){
      var insertHTML = ``
      chats.forEach(function(chat){
        insertHTML += buildMessage(chat);
      });
      $(".content__group__chat").append(insertHTML);
    })
    .fail(function(){
    })
  },function(){
    $(".content__group__chat").remove();
  })
});