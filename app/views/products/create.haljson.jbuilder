json._links do |lks|
 lks.self do |slf|
  slf.href product_url(@product)
 end
 lks.collection do |col| 
  col.href products_url
 end
end
json._controls do |ctls|
  ctls.delete do |d|
    d.target product_url(@product)
    d.method "DELETE"
  end
end
json.name @product.name
