# roadbike-portal DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|reported|float||
|banned|integer||
## Association
- has_many :bikes
- has_many :comments
- has_many :chats
## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :chats
## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
## Association
- belongs_to :group
- belongs_to :user
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :bike
## bikesテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null:false|
|weight|float|null:false|
|price|integer|null:false|
|model|string|null:false|
|user|references|null:false, foreign_key:true|
## Association
- belongs_to :user
- has_many :comments
- has_manu :images
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null:false|
|bike|references|foreign_key:true|
## Association
- belongs_to :bike
## dangersテーブル
|Column|Type|Options|
|------|----|-------|
|reported|integer||
|reporter|integer||

![roadbikerトップページ](https://user-images.githubusercontent.com/59146960/76069053-a179ac80-5fd5-11ea-9033-e1882d2f2c7d.png)

# ログインが終わるとトップページが表示されます
## 検索欄では登録されている車種を検索することができます
## 画面中央あたりのブランドから探すでは登録されたブランド一覧が重複無しで表示されます
## 画面下のコミュニティー一覧コミュニティー一覧はこちらを押すと存在するコミュニティーがすべて見られます
## 現在の動きがあったコミュニティーには最新の5件のメッセージが存在するコミュニティーを表示しており、それぞれ中身の一部が画面右下に表示されます。
## マイページを押すと本人が登録した商品を確認できます
## トップページから新規投稿ボタンを押すと以下の画像のような新規投稿ページに遷移します。

![roadbiker新規投稿画面](https://user-images.githubusercontent.com/59146960/76070114-582a5c80-5fd7-11ea-9945-8a7678b9f26b.png)
# 新規投稿ページでは ブランド名、車種名、価格、重さ、画像を一枚以上入力した上で投稿できます
![本人](https://user-images.githubusercontent.com/59146960/76071303-64171e00-5fd9-11ea-8770-c3e86a28c193.png)
# 投稿した自転車をトップページから選択すると上記の画像のように詳細を確認できます
![本人以外](https://user-images.githubusercontent.com/59146960/76071317-67aaa500-5fd9-11ea-92a8-85e0617f0952.png)
# また投稿した本人以外が投稿内容を閲覧すると右上に通報ボタンが表示されています
# 通報はポイント形式にしており5ポイントたまるとそのユーザーは一部の機能を制限されます。
## ユーザー2さんがユーザー1さんに画面を再読み込みすると複数回通報することができますが、ユーザー2さんのユーザー1さんに対する初めての通報は1ポイントとして扱われるのに対して、2回目以降は0.5ポイント、0.33ポイントとユーザー2のユーザー1に対する通報が重視されなくなっていきます。
## またこのページではそれぞれの投稿に関してのコメントを新規コメントボタンから送信することができます
![コミュニティー](https://user-images.githubusercontent.com/59146960/76072215-e8b66c00-5fda-11ea-83f5-ee8b54438fe0.png)
## コミュニティーでは上記の写真のようにユーザー同士で情報共有などができます

