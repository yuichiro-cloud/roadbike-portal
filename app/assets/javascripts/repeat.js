$(function(){
  $(".contents__top__user__report").on("click",function(){
    var userId = $(this).data('index');
    $.ajax({                            //通報ボタンを押した時のajax
      url: 'out',
      type: 'GET',
      data: { user_id: userId },
      dataType: 'json'
    })
    .done(function(info){
     if(info.num ==0){  //出品者が通報された+ブラックリストではない
       $.ajax({                         //通報ポイントを反映させるためのajax
        url: 'report',
        type: 'PATCH',
        data: { user_id: userId },
        dataType: 'json'
      })
      .done(function(message){
        if(message.word == "safe"){
        }else if(message.word == "ban"){
        };
      });
     };        

  });
  $(this).remove();   //通報ボタンを連続で押せないようにする処理
});
});