json._links do |lks|
  lks.self do |slf|
    slf.href product_url(@product)
  end
end
json.name @product.name
