$(function(){
  $(".contents__top__user__report").on("click",function(){
    console.log("ok");
    var userId = $(this).data('index');
    console.log(userId);
    $.ajax({
      url: 'out',
      type: 'GET',
      data: { user_id: userId },
      dataType: 'json'
    })
    .done(function(info){
      console.log(info.num);
     if(info.num ==0){  //出品者が初めて通報された場合
       console.log("通報初めて");
       $.ajax({
        url: 'manytimes',
        type: 'PATCH',
        data: { user_id: userId },
        dataType: 'json'
      })
      .done(function(chats){
        console.log("first返事");
      })
     }else              //出品者が過去に通報された場合
     console.log("過去に通報済み");
     $.ajax({
      url: 'manytimes',
      type: 'PATCH',
      data: { user_id: userId },
      dataType: 'json'
    })
    })
    .fail(function(){
    })

  })
});