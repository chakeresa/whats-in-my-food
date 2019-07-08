class FoodIndexFacade
  attr_reader :ingredient
  
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def foods
    
  end

  def food_count
    foods.count
  end
end
