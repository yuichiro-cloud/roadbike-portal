$(function(){
  last_chat_id = $(".chats__box:last").data("chat-id");
  function buildHTML(chat){
    var html =
    `<div class="chats__box" data-chat-id=${chat.id}>
    <div class="chats__box__chat">
    ${chat.text}
    </div>
    <div class="chats__box__name">
    ${chat.user}
    </div>
    <div class="chats__box__date">
    ${chat.date}
    </div>
    </div>`
    return html;
  }
  $("#new_chat").on("submit",function(e){
    e.preventDefault();
    // console.log("ok");
    // console.log(this)
    var formData = new FormData(this);
    var url = $(this).attr("action");
    // console.log(formData);
    $.ajax({
      url: url,
      type: "post",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $("#chats").append(html);
      $('#chats').animate({ scrollTop: $('#chats')[0].scrollHeight});  
      $('form')[0].reset();
      $(".form__submit").prop("disabled", false);
    
    })
  });
  var reloadChats = function(){
    last_chat_id = $(".chats__box:last").data("chat-id");
    $.ajax({
      url: "api/chats",
      type: "get",
      dataType: "json",
      data: {id: last_chat_id}
    })
    .done(function(chats){
      // console.log(chats);
      if (chats.length !== 0){
        var insertHTML = "";
        $.each(chats, function(i, chat){
          insertHTML += buildHTML(chat)
        });
        $("#chats").append(insertHTML);
        $("#chats").animate({scrollTop: $("#chats")[0].scrollHeight});
        $("#new_chat")[0].reset();
        $(".form__submit").prop("disabled", false);
      }
  })
  .fail(function(){
   });
  };
  if (document.location.href.match(/\/groups\/\d+\/chats/)) {
    console.log(document.location.href);
    setInterval(reloadChats, 7000);
  }
});