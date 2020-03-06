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
<!-- ![RoadBiker](https://imgur.com/lXuMkL1) -->
<!-- ![エビフライトライアングル](http://i.imgur.com/Jjwsc.jpg "サンプル") -->

