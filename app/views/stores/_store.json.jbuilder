json.extract! store, :id, :name, :phone, :rate, :address, :category, :created_at, :updated_at
json.url store_url(store, format: :json)