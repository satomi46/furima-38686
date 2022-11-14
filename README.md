# README


## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| title            | string  | null: false                    |
| price            | integer | null: false                    |
| shipping_cost_id | integer | null: false                    |
| explanation      | text    | null: false                    |
| category_id      | integer | null: false                    |
| status_id        | integer | null: false                    |
| place_id         | integer | null: false                    |
| days_to_ship_id  | integer | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
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
| place_id     | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase