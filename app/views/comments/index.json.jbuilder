json.comments @comments do |comment|
  json.name     comment.user.name
  json.comment  comment.comment
  json.time     comment.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.image    comment.image
  json.id       comment.id
end
