json._links do |link|
  link.self do |sf|
    sf.href products_url
  end
end

json._embedded do |ed|
  ed.products @products do |pt|
  
    json._links do |lk|
        lk.self product_url(pt)
    end
    json.name pt.name
  end
end

json._controls do |ctls|
  ctls.create do |crt|
    crt.method "POST"
    crt.target products_url
    crt.headers do |hdr|
      hdr.set! 'Content-Type', 'application/json'
    end
  end
end
