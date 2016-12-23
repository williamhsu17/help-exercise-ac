json.all_messages @messages do |m|
  json.message_id m.id
  json.status m.status
  json.category m.category_name
  json.title m.title
  json.content m.content
  json.created_time m.created_at
end