# README


## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| price         | integer    | null: false                    |
| shipping_cost | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | text       | null: false                    |
| status        | text       | null: false                    |
| place         | text       | null: false                    |
| days_to_ship  | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| credit_number       | integer    | null: false                    |
| credit_sec_code     | integer    | null: false                    |
| credit_expiry_year  | integer    | null: false                    |
| credit_expiry_month | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveriesテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase