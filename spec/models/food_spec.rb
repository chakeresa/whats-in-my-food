require 'rails_helper'

RSpec.describe Food do
  it 'inits with attributes' do
    group = "vegetables"
    name = "cucumber"
    ndbno = "42"
    ds = "LI"
    manu = "a farm"

    attributes = {
      "group" => group,
      "name" => name,
      "ndbno" => ndbno,
      "ds" => ds,
      "manu" => manu
    }
    food = Food.new(attributes)
    
    expect(food.food_group).to eq(group)
    expect(food.name).to eq(name)
    expect(food.ndb_number).to eq(ndbno)
    expect(food.data_source).to eq(ds)
    expect(food.manufacturer).to eq(manu)
  end
end
