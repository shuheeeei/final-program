json.array! @meigens do |meigen|
  json.id meigen.id
  json.content meigen.content
  json.source meigen.source
  json.user_name meigen.user.name
end

json.array! @source_meigens do |source_meigen|
  json.source_id source_meigen.id
  json.source_content source_meigen.content
  json.source source_meigen.source
  json.source_user_name source_meigen.user.name
end

json.array! @tag_meigens do |tag_meigen|
  json.tag_id tag_meigen.id
  json.tag_content tag_meigen.content
  json.tag_source tag_meigen.source
  json.tag tag_meigen.name
  json.tag_user_name tag_meigen.user.name
end
