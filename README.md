# テーブル設計

## Users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| admin    |  | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
 
 - has_many :items
 - has_many :purchases
 - has_many :blogs
 - has_many :comments

 ## Items テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| text     | string     | null: false                    |
| price    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| image    |            | null: false                    |


### Association
 
 - belongs_to :user
 - has_one    :purchase

 ## Ordersテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
 
 - belongs_to             :purchase
 - belongs_to_active_hash :prefecture

 ## Purchasesテーブル
| Column   | Type           | Options                        |
| -------- | -------------- | ------------------------------ |
| user     | references     |              foreign_key: true |
| item     | references     | null: false, foreign_key: true |

### Association
 
 - belongs_to user
 - belongs_to item

 ## Blogs テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| image    |            |                                |

### Association
 
 - belongs_to :user
 - has_many :comments

## Comments テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| blog     | references | null: false, foreign_key: true |

### Association
 
 - belongs_to :user
 - belongs_to :blog

