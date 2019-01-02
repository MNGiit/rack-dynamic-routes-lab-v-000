class Application
  
  # instructions
  # accept the /items/<ITEM NAME> route, and everything else should 404
  # if user requests /items/<ITEM NAME>, return price of that item
  # if user requests item that you don't have, return 400 and error message
  
  def call(env)
            
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items = Item.all
    
    route_match = true if req.path.match(/items/)
    # find_this = req.path.split("/items").last if route_match
    # found_item = ""
    

    
    if route_match
      item_name = req.path.split("/items/").last
      if item =@@items.find{ |i| i.name == item_name }
        resp.write item.price
      else 
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end # end of nested if
    
    resp.finish
  end # end of def call

end # end of class









