User table
  has_many :chatgroups_link_users
  has_many :comments

Chat_group table
  has_many :users
  has_many :comments

Chatgroups_link_user table
  has_many :users
  has_many :chat_groups

Comment table
  belongs_to :users
  belongs_to :chat_groups

Image table
  belongs_to :users
  belongs_to :chat_groups

<!-- カラム名とカラムの型は次のコミットで作成予定 -->
