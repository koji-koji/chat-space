# DB設計

## users table  

  |Column       |Type      |Options                   |
  |:-----------:|:--------:|:------------------------:|
  |name         |string    |null: false, unique: true , add_index|
  |Email        |string    |null: false, unique: true |
  |password     |string    |null:false                |
  |timestamps   |timestamps|                          |

## Association  

  - has_many :chatgroups, through: :chatgroup_users
  - has_many :comments
  - has_many :chatgroup_users

*****



## chatgroups table  

  |Column       |Type      |  Options                 |
  |:-----------:|:--------:|:------------------------:|
  |group_name   |string    | null: false, unique: true|
  |timestamps   |timestamps|                          |

## Association  

  - has_many :users, through: :chatgroup_users
  - has_many :comments
  - has_many :chatgroup_users

*****



## chatgroup_users table  

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |user_id      |references   |ON UPDATE CASCADE ON DELETE CASCADE|
  |chatgroup_id |references   |ON UPDATE CASCADE ON DELETE CASCADE|


## Association  

  - belongs_to :user
  - belongs_to :chatgroup

*****



## comments table  

  |Column       |Type         |Options                   |
  |:-----------:|:-----------:|:------------------------:|
  |comment      |text         |null: false               |
  |chatgroup_id |references   |ON UPDATE CASCADE ON DELETE CASCADE|
  |user_id      |references   |ON UPDATE CASCADE ON DELETE CASCADE|
  |timestamps   |timestamps   |                          |

## Association  

  - belongs_to :user
  - belongs_to :chat_group

