json.extract! order, :id, :title, :descreption, :price, :location, :category, :images, :created_at, :updated_at
json.url order_url(order, format: :json)
json.images do
  json.array!(order.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
