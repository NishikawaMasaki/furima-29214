# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| sei           | string  | null: false |
| mei           | string  | null: false |
| sei(hurigana) | string  | null: false |
| mei(hurogana) | string  | null: false |
| birthday      | date    | null: false |

### Association

- has_many :items
- has_many :buy

## items テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| image    | string      | null: false                    |
| name     | string      | null: false                    |
| explain  | string      | null: false                    |
| category | string      | null: false                    |
| statu    | string      | null: false                    |
| delivery | string      | null: false                    |
| area     | string      | null: false                    |
| day      | string      | null: false                    |
| price    | integer     | null: false                    |
| user     | references  | null: false, foreign_key :true |


### Association
- has_one    :buy
- belongs_to :users

## buys テーブル

| Column  | Type        | Options                        |
| ------  | ----------- | ------------------------------ |
| user    | references  | null: false, foreign_key :true |
| item    | references  | null: false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| card_no    | string      | null: false                    |
| period     | string      | null: false                    |
| security   | string      | null: false                    |
| post_no    | string      | null: false                    |
| prefecture | string      | null: false                    |
| city       | string      | null: false                    |
| number     | integer     | null: false                    |
| building   | string      | null: false                    |
| tel        | integer     | null: false                    |
| buy        | references  | null: false, foreign_key :true |

### Association

- belongs_to :buy
