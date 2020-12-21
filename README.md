## usersテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|nickname     |string    |NOT:NULL   |
|email        |string    |NOT:NULL   |
|password     |string    |NOT:NULL   |
|kanji_name   |string    |NOT:NULL   |
|katakana_name|string    |NOT:NULL   |
|birthday     |string    |NOT:NULL   |
|item         |references|foreign_key: true|

### Association
- has_many : items
- has_many : purchases

## itemsテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|name         |string    |NOT:NULL   |
|category     |string    |NOT:NULL   |
|price        |string    |NOT:NULL   |
|explanation  |string    |NOT:NULL   |
|state        |string    |NOT:NULL   |
|deliveryfee  |string    |NOT:NULL   |
|area         |string    |NOT:NULL   |
|day          |string    |NOT:NULL   |
|user         |references|foreign_key: true|

### Association
- belongs_to : users
- has_one : purchases

##　purchasesテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|user         |references|foreign_key: true|
|item         |references|foreign_key: true|

### Association
- belongs_to : users
- has_one : items
- has_pne : streetaddress

## streetaddressテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|postalcode   |string    |NOT:NULL   |
|prefectures  |string    |NOT:NULL   |
|municipality |string    |NOT:NULL   |
|address      |string    |NOT:NULL   |
|phonenumber  |string    |NOT:NULL   |

## Association
- has_one : purchases
