# README
# 最終課題 内容説明
***
# 概要
***
自身が感動・共感した名言を投稿できるオリジナルサービス。
- 名言の発言者や元になった作品(書籍・映画etc...)の画像投稿
- 投稿する画像は投稿者自身がアップロードするか他の投稿者がアップロードした画像を選択するかを選べる
- 投稿者が感動した理由や場面を紹介できる

# DB設計
***

## users テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :meigens
- has_many :comments
- has_many :likes


## meigens テーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false, index: true|
|scene|text||
|image|string||
|like_count|integer||
|comment_count|integer||

### Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :commments, dependent: :destroy
- has_many :meigen_tags
- has_many :tags, through: :meigen_tags, dependent: :destroy


## comments テーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false, index: true, unique: true|
|user_id|reference|null: false, foregn_key: true|
|meigen_id|reference|null: false, foregn_key: true|

### Association
- belongs_to :user
- belongs_to :meigen


## likes テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foregn_key: true|
|meigen_id|reference|null: false, foregn_key: true|

### Association
- belongs_to :user
- belongs_to :meigen


## tags テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|meigen_id|reference|null: false, foregn_key: true|

### Association
- has_many :meigen_tags
- has_many :meigens, through: :meigen_tags


## meigen_tags テーブル

|Column|Type|Options|
|------|----|-------|
|meigen_id|reference|null: false, foregn_key: true|
|tag_id|reference|null: false, foregn_key: true|

### Association
- belongs_to :meingen
- belongs_to :tags
