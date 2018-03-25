json.extract! item, :id, :created_at, :updated_at, :item_alias
json.url item_url(item, format: :json)
json.item_alias_name item.item_alias.name
