json.extract! product, :id, :name, :number, :description, :on_shelf, :price, :product_category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
