# fleamarket DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|nickname|string|null: false, index: true|
|name|string|null: false|
|name_kana|string|null: false|
|birthday|date|null: false|
|destination_name|string|null: false|
|destination_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|after_adress|string|
|phone|string|
### Association
- has_many :items
- has_many :cards
- has_many :likes
- has_many :comments


## itemsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|name|string|null: false, index: true|
|explanation|text|null: false|
|brand|string|index: true|
|condition|string|null: false|
|delivery_fee|string|null: false|
|area|string|null: false|
|day|string|null: false|
|size|string|
|delivery_method|string|null: false|
|price|integer|null: false, index: true|
|seller|integer|null: false, foreign_key: true|
|buyer|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- has_many :likes
- has_many :comments
- belongs_to :user
- belongs_to :category


## cardsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|number|integer|null: false|
|limit|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## imagesテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item


## likesテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :item


## categoriesテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|name|string|null: false, index: true|
### Association
- has_many :items
