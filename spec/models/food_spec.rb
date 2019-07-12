require 'spec_helper'
# ^ runs faster than rails_helper when we're just testing POROs / services

RSpec.describe Food do
  # another way of setting up the test:
  # let(:attrs) { <put attributes hash here> }
  # subject { Food.new(attrs) }
  # ... then do assertions on subject
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
