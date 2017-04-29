User table
  has_many :chatgroups, :through => :chatgroup_user
  has_many :comments
  has_many :chatgroup_user


Chatgroup table
  has_many :users, :through => :chatgroup_user
  has_many :comments
  has_many :chatgroup_user


Chatgroup_user table
  has_many :users
  has_many :chat_groups

Comment table
  belongs_to :users
  belongs_to :chat_groups


<!-- カラム名とカラムの型は次のコミットで作成予定 -->
