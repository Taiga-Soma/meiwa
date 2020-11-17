# README

## users テーブル

| Colum           | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| firstname       | string | null: false |
| lastname        | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date	 | null: false |

### Association
  has_many :homes


## homes テーブル

|Colum	         | Type	       |  Options                        |
| -------------- | ----------- | ------------------------------- |
|building_name	 | string	     | null: false                     |
|price	         | integer	   | null: false                     |
|interest＿rate	 | string	     | null: false                     |
|post_id	       | string	     | null: false                     |
|prefectures_id	 | integer	   | null: false                     |
|city	           | string	     | null: false                     |
|address	       | string	     | null: false                     |
|tel	           | string	     | null: false                     |
|user	           | references	 | null: false, foreign_key: true  |

### Association
  belongs_to :user