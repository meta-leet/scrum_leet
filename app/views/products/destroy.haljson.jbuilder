json._links do |lks|
  lks.self do |slf|
    slf.href product_url(@product.id)
  end
  lks.collection do |col|
    col.href products_url
  end
end
json.name @product.name
