json._controls do |ctls|
  ctls.delete do |dlt|
    ctls.method "DELETE"
    ctls.target product_url(@product)
  end

  ctls.update do |updt|
    updt.method "PUT"
    updt.target product_url(@product)
    updt.schema asset_url('schema/product.json')
  end

end
