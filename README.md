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


## アプリケーション名
- fishcamp

## アプリケーションの概要
- とある商店のECサイトを想定して作成

## URL
- http://52.199.248.30/

## テスト用アカウント
### 管理者
# アドレス
- kanri@admin.jp
# パスワード
- 1111111
### 仮想お得意さん
# アドレス
- m@w
# パスワード
- 111111
## 利用方法
- 
- 
- 


## 目指した課題解決
###

## 洗い出した要件

| 優先順位 | 機能 | 目的 | 詳細 | ストーリー | 所要時間 |
|:---:|:---:|:---|:---|:---|:---:|
| 3 | 管理人(admin)さん配置 | 個人ECサイトにおいて店主である管理人は必要不可欠 | gemであるadminをインストールして全てを管理できるユーザー権限を与える | ・管理人を店主として捉えた場合、商品の出品は当然管理側しかできないはずなのでその権限を与える<br>・商品のアピール、それに準ずる自身の活動などを記すブログ機能も管理人にのみ付与して、より購買意欲をそそるECサイトを実現する | 12 |
| 3 | deviseによるユーザー登録 | ECサイトのお得意さん獲得 | ユーザー登録が簡単にできる | ・ユーザー登録しなくとも商品の購入はできるが、店主のブログにコメントができない<br>・登録することにより、ブログへのコメントを残すことができる<br>・店側とより親密な関係を築ける | 12 |
| 2 | ブログ機能 | 商品アピール、自身の活動記録 | トップページにおいて管理側にしか表示されないブログ投稿のリンクを作成 | ・目的の通り、販売促進も兼ねた日記帳のような物を想定<br>・トップページ下部へ一覧表示されることによりユーザーは見やすい | 12 |
| 2 | 出品機能 | 商品ありきのサイトである | トップページにおいて管理側にしか表示されない商品出品のリンクを作成 | ・要の商い品<br>・トップページブログ一覧上部に配置<br>・購入は詳細ページにて可能 | 5 |
| 2 | 購入機能 | PAY .JPによる商品購入 | 商品詳細画面にて購入ボタンクリックで購入できる | ・ユーザーでもゲストでもクレジットカードを用いた購入 | 5 |
| 2 | コメント機能 | ユーザーによるブログはのコメント | ブログ詳細画面でコメントを残すことができる | ・管理側が投稿したブログに対してコメントを残すことにより、互いにより親密な関係を築くことができる | 8 |

## 実装した機能についてのGIFと説明

### https://i.gyazo.com/84c7c2d67fcb83517b42407b1ca077ac.jpg

### https://i.gyazo.com/fef263c5be4ae7e57d7a2bb8c1f1c691.jpg

### https://i.gyazo.com/332d7b1ed36a9ab1d8d49678e4db7594.jpg