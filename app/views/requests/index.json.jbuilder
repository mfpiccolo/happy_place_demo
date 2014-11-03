json.array!(@requests) do |request|
  json.extract! request, :id, :type, :shipping_address, :purchase_order_id
  json.url request_url(request, format: :json)
end
