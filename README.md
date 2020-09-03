# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| -------------   | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| name     | string      | null: false                    |
| explain  | text        | null: false                    |
| category | string      | null: false                    |
| status   | string      | null: false                    |
| delivery | string      | null: false                    |
| area     | string      | null: false                    |
| day      | string      | null: false                    |
| price    | integer     | null: false                    |
| user     | references  | null: false, foreign_key :true |


### Association
- has_one    :buy
- belongs_to :user

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
| postal     | string      | null: false                    |
| prefecture | string      | null: false                    |
| city       | string      | null: false                    |
| number     | integer     | null: false                    |
| building   | string      | null: false                    |
| tel        | integer     | null: false                    |
| buy        | references  | null: false, foreign_key :true |

### Association

- belongs_to :buy
