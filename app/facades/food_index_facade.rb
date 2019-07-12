class FoodIndexFacade
  attr_reader :ingredient

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def foods
    if errors?
      []
    else
      foods_hash = response["list"]["item"]
      foods_hash.map do |food_data|
        Food.new(food_data)
      end.first(10)
    end
  end

  def food_count
    if errors?
      0
    else
      response["list"]["total"]
    end
  end

  private

  def service
    @service ||= UsdaFoodApiService.new
  end

  def response
    @response ||= service.foods_with_ingredient(@ingredient)
  end

  def errors?
    response["errors"] ? true : false
  end
end
