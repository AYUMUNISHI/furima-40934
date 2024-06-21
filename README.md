# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------        | ----------- |
| nickname           | string        | null: false |ニックネーム
| email              | string        | null: false, unique: true |
| encrypted_password | string        | null: false |パスワード
| last_name          | string        | null: false |苗字
| first_name         | string        | null: false |名前
| last_name_kana     | string        | null: false |苗字（カナ）
| first_name_kana    | string        | null: false |名前（カナ）
| birthday           | date          | null: false |誕生日

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| product            | string  | null: false |商品名
| description        | text    | null: false |商品の説明
| category_id        | integer | null: false |カテゴリー
| status_id          | integer | null: false |状態
| freight_id         | integer | null: false |送料
| prefecture_id      | integer | null: false |都道府県
| shipping_date_id   | integer | null: false |日数
| price              | integer | null: false |値段
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category
- belongs_to :status
- belongs_to :freight
- belongs_to :prefecture
- belongs_to :shipping_date


## orders テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address


## addresses テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| postcode           | string     | null: false |郵便番号
| prefecture_id      | integer    | null: false |都道府県
| city               | string     | null: false |市町村
| block              | string     | null: false |番地
| building           | string     |             |建物名・部屋番号
| phone              | string     | null: false |電話番号
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefecture

