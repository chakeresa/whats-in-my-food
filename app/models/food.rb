class Food
  attr_reader :food_group,
              :name,
              :ndb_number,
              :data_source,
              :manufacturer

  def initialize(food_data)
    @food_group = food_data["group"]
    @name = food_data["name"]
    @ndb_number = food_data["ndbno"]
    @data_source = food_data["ds"]
    @manufacturer = food_data["manu"]
  end
end
