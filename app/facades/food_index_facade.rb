class FoodIndexFacade
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def foods
    foods_hash = response["list"]["item"]
    foods_hash.map do |food_data|
      Food.new(food_data)
    end.first(10)
  end

  def food_count
    response["list"]["total"]
  end

  private

  def service
    UsdaFoodApiService.new
  end

  def response
    service.foods_with_ingredient(@ingredient)
  end
end
