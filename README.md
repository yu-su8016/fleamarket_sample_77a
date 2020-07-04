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
|condition_id(active_hash)|string|null: false|
|delivery_fee_id(active_hash)|string|null: false|
|prefecture_id(active_hash)|integer|null: false|
|day_id(active_hash)|string|null: false|
|size|string|
|delivery_method_id(active_hash)|string|null: false|
|price|integer|null: false, index: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
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
|customer_id|string|null: false|
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
|name|string(active_hash)|null: false, index: true|
|ancestry|string|index: true|
### Association
- has_many :items

## destinationsテーブル
|Column|Type|Option|
|------|----|------|
|id|integer|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|after_address|string|
|phone|string|
### Association
- belongs_to :user