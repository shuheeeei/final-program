json.array! @source_meigens do |source_meigen|
  json.source_id source_meigen.id
  json.source_content source_meigen.content
  json.source source_meigen.source
  json.source_user_name source_meigen.user.name
end
