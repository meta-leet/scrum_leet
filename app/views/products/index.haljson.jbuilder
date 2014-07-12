json._links do |link|
  link.self do |sf|
    sf.href products_url
  end
end

json._embeded do |ed|
  ed.products @products do |pt|
  
      json._links do |lk|
        lk.self product_url(pt)
      end
      json.name pt.name
    end
  end

