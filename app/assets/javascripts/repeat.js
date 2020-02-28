$(function(){
  $(".contents__top__user__report").on("click",function(){
    console.log("ok");
    var userId = $(this).data('index');
    $.ajax({                            //通報ボタンを押した時のajax
      url: 'out',
      type: 'GET',
      data: { user_id: userId },
      dataType: 'json'
    })
    .done(function(info){
      console.log(info.num);
     if(info.num ==0){  //出品者が通報された+ブラックリストではない
       $.ajax({                         //通報ポイントを反映させるためのajax
        url: 'report',
        type: 'PATCH',
        data: { user_id: userId },
        dataType: 'json'
      })
      .done(function(message){
        console.log(message.word);
        if(message.word == "safe"){
          console.log("まだセーフ");
        }else if(message.word == "ban"){
          console.log("アウト");
        };
      });
     };        

  });
  $(this).remove();   //通報ボタンを連続で押せないようにする処理
});
});