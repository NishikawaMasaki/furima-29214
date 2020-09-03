# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |

##| name kanji    | string  | null: false |
##| name katakana | string  | null: false |
##| birthday      | integer | null: false |

### Association

- has_many :items
- has_one :buy

## items テーブル

| Column  | Type        | Options                        |
| ------  | ----------- | ------------------------------ |
| image   | string      | null: false                    |
| text    | string      | null: false                    |
| user_id | references  | null: false, foreign_key :true |


### Association
- has_one :buy
- belongs_to :users

## buys テーブル

| Column  | Type        | Options                        |
| ------  | ----------- | ------------------------------ |
| text    | string      | null: false                    |
| user_id | references  | null: false, foreign_key :true |
| item_id | references  | null: false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item

## address テーブル

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| text   | string      | null: false                    |
| buy_id | references  | null: false, foreign_key :true |

### Association

- belongs_to :buy