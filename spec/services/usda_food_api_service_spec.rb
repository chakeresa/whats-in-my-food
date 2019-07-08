require 'rails_helper'

RSpec.describe UsdaFoodApiService do
  it 'fetches a list of foods with a particular ingredient' do
    WebMock.allow_net_connect!
    VCR.turn_off!
    ingredient = "sweet potatoes"
    service = UsdaFoodApiService.new
    require 'pry'; binding.pry
    expect(service.foods_with_ingredient(ingredient).count).to eq(531)
    expect(service.foods_with_ingredient(ingredient)).to have_key("some key")
    expect(service.foods_with_ingredient(ingredient).first).to have_key("some other key")
  end
end
