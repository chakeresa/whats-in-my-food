class FoodIndexFacade
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def foods
    foods_hash = service.foods_with_ingredient(@ingredient)
    foods_hash.map do |food_data|
      Food.new(food_data)
    end
  end

  def food_count
    foods.count
  end

  private

  def service
    UsdaFoodApiService.new
  end
end
