require 'rails_helper'

RSpec.describe UsdaFoodApiService do
  it 'fetches a list of foods with a particular ingredient' do
    WebMock.allow_net_connect!
    VCR.turn_off!
    ingredient = "sweet potatoes"
    service = UsdaFoodApiService.new
    expect(service.foods_with_ingredient(ingredient)).to have_key("list")
    expect(service.foods_with_ingredient(ingredient)["list"]["total"]).to eq(531)
    # "group", "name", "ndbno", "ds", "manu"
    expect(service.foods_with_ingredient(ingredient)["list"]["item"].first).to have_key("group")
    expect(service.foods_with_ingredient(ingredient)["list"]["item"].first).to have_key("name")
    expect(service.foods_with_ingredient(ingredient)["list"]["item"].first).to have_key("ndbno")
    expect(service.foods_with_ingredient(ingredient)["list"]["item"].first).to have_key("ds")
    expect(service.foods_with_ingredient(ingredient)["list"]["item"].first).to have_key("manu")
  end
end
