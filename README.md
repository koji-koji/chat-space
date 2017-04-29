users table
  has_many :chatgroups, through: :chatgroup_users
  has_many :comments
  has_many :chatgroup_users


chatgroups table
  has_many :users, through: :chatgroup_users
  has_many :comments
  has_many :chatgroup_users


chatgroup_users table
  has_many :users
  has_many :chat_groups

comments table
  belongs_to :user
  belongs_to :chat_group


<!-- カラム名とカラムの型は次のコミットで作成予定 -->
