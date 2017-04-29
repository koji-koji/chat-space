# users table

  user_name   string    null: false, unique: true
  Email       string    null: false, unique: true
  password    string    null:false

  has_many :chatgroups, through: :chatgroup_users
  has_many :comments
  has_many :chatgroup_users



# chatgroups table

  group_name  string    null: false, unique: true

  has_many :users, through: :chatgroup_users
  has_many :comments
  has_many :chatgroup_users


# chatgroup_users table

  user_id       integer
  chatgroup_id  integer

  belongs_to :user
  belongs_to :chatgroup

# comments table

  comment         text    null: false
  chatgroup_id    integer
  user_id         integer
  timestamps

  belongs_to :user
  belongs_to :chat_group

<!-- マークダウンは次回のコミットで導入予定 -->
