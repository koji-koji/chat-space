json.comment @comment.comment
json.name @comment.user.name
json.image @comment.image
json.time @comment.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.id @comment.id
