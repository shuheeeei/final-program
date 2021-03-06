
# TECH::EXPERT最終課題 内容説明
# 1.概要
自身が感動・共感した名言を投稿できるオリジナルサービス。
- 名言の発言者や元になった作品(書籍・映画etc...)の画像投稿
- 投稿する画像は投稿者自身がアップロードする
- 投稿者が感動した理由や場面を紹介できる
- 名言には「いいね！」、「タグ付け」、「コメント」ができる


# 2.DB設計補足
- ## usersテーブル
emailカラムとpasswordカラム：devise gemを使用する。
- ## meigens テーブル
名言投稿が削除されると、その投稿につけられているタグといいねも同時に削除される。
- ## tagsテーブル
「acts-as-taggable-on」gemを使用して投稿(名言)にタグ付けする。
- ## meigen_tags テーブル
meigensテーブルとtagsテーブルの中間テーブル


# 3.DB設計
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
|user_id|reference|foreign_key: true|
|likes_count|integer||
|comments_count|integer||

### Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :meigen_tags
- has_many :tags, through: :meigen_tags


## comments テーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false, index: true|
|user_id|reference|null: false, foreign_key: true|
|meigen_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :meigen, counter_cache: true


## likes テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|meigen_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :meigen, counter_cache: true


## tags テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|meigen_id|reference|null: false, foreign_key: true|

### Association
- has_many :meigen_tags
- has_many :meigens, through: :meigen_tags


## meigen_tags テーブル

|Column|Type|Options|
|------|----|-------|
|meigen_id|reference|null: false, foreign_key: true|
|tag_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :meigen
- belongs_to :tag
