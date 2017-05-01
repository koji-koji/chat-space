# DB設計

## users table  

  |Column       |Type      |Options                   |
  |:-----------:|:--------:|:------------------------:|
  |user_name    |string    |null: false, unique: true |
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

  |Column       |Type      |Options                   |
  |:-----------:|:--------:|:------------------------:|
  |user_id      |integer   |                          |
  |chatgroup_id |integer   |                          |


## Association  

  - belongs_to :user
  - belongs_to :chatgroup

*****



## comments table  

  |###Column    |###Type   |  ###Options              |
  |:-----------:|:--------:|:------------------------:|
  |comment      |text      |null: false               |
  |chatgroup_id |integer   |                          |
  |user_id      |integer   |                          |
  |timestamps   |timestamps|                          |

## Association  

  - belongs_to :user
  - belongs_to :chat_group
