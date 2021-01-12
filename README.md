## usersテーブル

|Column             |Type            |Options       |
|-------------------|----------------|--------------|
|nickname           |string    |null: false   |
|email              |string    |null: false, unique: true|
|encrypted_password |string    |null: false   |
|kanji_first_name   |string    |null: false   |
|kanji_last_name    |string    |null: false   |
|katakana_first_name|string    |null: false   |
|katakana_last_name|string    |null: false   |
|birthday           |date      |null: false   |

### Association
- has_many : items
- has_many : orders

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
- has_one : order

## ordersテーブル

|Column       |Type      |Options    |
|-------------|----------|-----------|
|user         |references|foreign_key: true|
|item         |references|foreign_key: true|

### Association
- belongs_to : user
- belongs_to : item
- has_one : residence

## residenceテーブル

|Column          |Type      |Options      |
|----------------|----------|-------------|
|postal_code      |string    |null: false  |
|prefecture_id   |integer   |null: false  |
|municipality    |string    |null: false  |
|address         |string    |null: false  |
|building_name   |string    |             |
|phone_number    |string    |null: false  |
|order           |references|foreign_key: true|

## Association
- belongs_to : order
