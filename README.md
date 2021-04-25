# テーブル設計

## users テーブル

|  Column             |  Type   |  options                  |
|  ---------------    |  ------ |  -----------              |
|  nickname           |  string |  null: false              |
|  email              |  string |  null: false,unique: true |
|  family_name        |  string |  null: false              |
|  first_name         |  string |  null: false              |
|  family_name_kana   |  string |  null: false              |
|  first_name_kana    |  string |  null: false              |
|  birth_date         |  date   |  null: false              |
|  encrypted_password |  string |  null: false              |
### Association

- has_many :items
- has_many :orders


## items テーブル

|  Column           |  Type      |  options                       |
|  ---------------- |  --------- |  -----------                   |
|  name             |  string    |  null: false                   |
|  description      |  text      |  null: false                   |
|  category_id      |  integer   |  null: false,                  |
|  condition_id     |  integer   |  null: false                   |
|  shipping_cost_id |  integer   |  null: false                   |
|  shipping_area_id |  integer   |  null: false                   |
|  shipping_time_id |  integer   |  null: false                   |
|  price            |  integer   |  null: false                   |
|  user             |  references|  null: false, foreign_key:true |
### Association

- belongs_to :user
- has_one :order

## delivery_addresses テーブル

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| shipping_area_id| integer    | null: false                    |
| city            | string     | null: false                    |
| home_number     | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| user_id         | integer    | null: false, foreign_key: true |
| item_id        | integer    | null: false, foreign_key: true |

### Association

has_one: delivery_address
belongs_to: user
belongs_to: item