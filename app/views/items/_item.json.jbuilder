json.extract! item, :id, :payment_type_id, :category_id, :name, :amount, :event_date, :payment_date, :created_at, :updated_at
json.url item_url(item, format: :json)
