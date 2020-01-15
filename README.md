# roadbike-portal DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
## Association
- has_many :bikes
- has_many :comments
- has_many :chats
- has_many :groups, through:  :users_groups
## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :chats
- has_many :users, through:  :users_groups
## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :group
## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
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
|title|string|null: false|
|image|string||
|brand|references|null: false, foreign_key: true|
|price|references|null: false, foreign_key: true|
|weight|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- has_many :comments
- belongs_to :brand
- belongs_to :price
- belongs_to :weight
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|
## Association
- has_many :bikes
## pricesテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
## Association
- has_many :bikes
## weightテーブル
|Column|Type|Options|
|------|----|-------|
|weight|float|null: false|
## Association
- has_many :bikes
