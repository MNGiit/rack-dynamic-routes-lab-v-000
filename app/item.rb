class Item
  attr_accessor :name, :price
  @@all = [] #added this
  
  def initialize(name,price)
    @name = name
    @price = price
    @@all << self #added this
  end
  
  #added this def
  def self.all
    @@all
  end
  
end
