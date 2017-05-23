json.comments @chatgroup.comments.each do |comment|
  json.name     comment.user.name
  json.comment  comment.comment
  json.time     comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.image    comment.image
  json.id       comment.id
end
