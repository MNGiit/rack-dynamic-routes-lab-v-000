class Application
  
  # instructions
  # accept the /items/<ITEM NAME> route, and everything else should 404
  # if user requests /items/<ITEM NAME>, return price of that item
  # if user requests item that you don't have, return 400 and error message
  
  def call(env)
            
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items = Item.all
    
    route_match = false
    route_match = true if req.path.match(/items/)
    find_this = req.path.split("/items").last if route_match
    found_item = nil
    
    if route_match
      # check for item name
      # if find_this
      #  @@items.each do |item|
      #    found_item ||= item if item.name == find_this
      #  end
        # show item price
      #  resp.write found_item.price
      if item =@@items.find{|i| i.name == find_this }
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      # route_match is false, route was not found
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end # end of def call
  
end # end of class









