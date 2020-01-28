json.array! @chats do |chat|
  json.text chat.text
  json.user chat.user.nickname
  json.group_id chat.group_id
  json.date chat.created_at
  json.id chat.id
end