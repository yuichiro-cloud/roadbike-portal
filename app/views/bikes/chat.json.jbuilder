json.array! @chats do |chat|
  json.id chat.id
  json.text chat.text
  json.user_id  chat.user_id
  json.group_id chat.group_id
  json.date chat.created_at
end