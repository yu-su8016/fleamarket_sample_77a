# fleamarket DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|nickname|string|null: false, index: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
### Association
- has_many :items
- has_many :cards
- has_many :likes
- has_many :comments
- has_many :destinations

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|name|string|null: false, index: true|
|explanation|text|null: false|
|brand|string|index: true|
|condition|string|null: false|    ※active_hash
|delivery_fee|string|null: false|    ※active_hash
|area|string|null: false|    ※active_hash
|day|string|null: false|    ※active_hash
|size|string|    ※active_hash
|delivery_method|string|null: false|    ※active_hash
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
|name|string|null: false, index: true|    ※active_hash
|ancestry|string|index: true|
### Association
- has_many :items

## destinationsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|destination_name|string|null: false|
|destination_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|    ※active_hash
|city|string|null: false|
|address|string|null: false|
|after_adress|string|
|phone|string|
### Association
- belongs_to :user