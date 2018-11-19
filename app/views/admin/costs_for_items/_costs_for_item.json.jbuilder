json.extract! costs_for_item, :id, :user_id, :item_id, :cost_ratio, :selling_cost, :freight_cost_in, :freight_cost_out, :storage_cost, :created_at, :updated_at
json.url costs_for_item_url(costs_for_item, format: :json)
