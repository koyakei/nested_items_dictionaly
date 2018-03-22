json.extract! item_image, :id, :item_id, :image_path, :name, :description, :created_at, :updated_at
json.url item_image_url(item_image, format: :json)
