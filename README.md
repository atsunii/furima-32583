## usersテーブル

|Column             |Type            |Options       |
|-------------------|----------------|--------------|
|nickname           |string    |null: false   |
|email              |string    |null: false, unique: true|
|encrypted_password |string    |null: false   |
|kanji_first_name   |string    |null: false   |
|kanji_last_name    |string    |null: false   |
|katakana_first_name|string    |null: false   |
|katakana_first_name|string    |null: false   |
|birthday           |date      |null: false   |

### Association
- has_many : items
- has_many : purchases

## itemsテーブル

|Column        |Type      |Options      |
|--------------|----------|-------------|
|name          |string    |null: false  |
|category_id   |integer   |null: false  |
|price         |integer   |null: false  |
|explanation   |text      |null: false  |
|state_id      |integer   |null: false  |
|deliveryfee_id|integer   |null: false  |
|prefecture_id |integer   |null: false  |
|day_id        |integer   |null: false  |
|user          |references|foreign_key: true|

### Association
- belongs_to : user
- has_one : purchase

##　purchasesテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|user         |references|foreign_key: true|
|item         |references|foreign_key: true|

### Association
- belongs_to : user
- belongs_to : item
- has_one : streetaddress

## streetaddressテーブル

|Column          |Type      |Options      |
|----------------|----------|-------------|
|postalcode      |string    |null: false  |
|prefecture_id   |integer   |null: false  |
|municipality    |string    |null: false  |
|address         |string    |null: false  |
|building_name   |string    |             |
|phonenumber     |string    |null: false  |
|purchase        |references|foreign_key: true|

## Association
- belongs_to : purchase
