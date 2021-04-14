# テーブル設計

## users テーブル

|  Column           |  Type   |  options                  |
|  ---------------  |  ------ |  -----------              |
|  nickname         |  string |  null: false,unique: true |
|  email            |  string |  null: false,unique: true |
|  family_name      |  string |  null: false              |
|  first_name       |  string |  null: false              |
|  family_name_kana |  string |  null: false              |
|  first_name_kana  |  string |  null: false              |
|  birth_date       |  date   |  null: false              |

### Association

- has_many :products
- has_many :item_purchase

## products テーブル

|  Column           |  Type      |  options                       |
|  ---------------- |  --------- |  -----------                   |
|  photo            |  text      |  null:false                    |
|  name             |  string    |  null: false                   |
|  description      |  text      |  null: false                   |
|  category         |  references|  null: false, foreign_key:true |
|  condition        |  integer   |  null: false                   |
|  shipping_cost    |  string    |  null: false                   |
|  shipping_area    |  string    |  null: false                   |
|  shipping_time    |  string    |  null: false                   |
|  price            |  integer   |  null: false                   |
|  user             |  references|  null: false                   |
### Association

- belongs_to :user
- has_one :item_purchase

## delivery_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| home_number   | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase | integer    | null: false, foreign_key: true |

### Association

- has_one :item_purchase
