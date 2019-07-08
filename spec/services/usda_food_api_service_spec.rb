require 'rails_helper'

RSpec.describe UsdaFoodApiService do
  it 'fetches a list of foods with a particular ingredient' do
    VCR.use_cassette('api_fetches_list_of_foods_by_ingredient', record: :new_episodes) do
      ingredient = "sweet potatoes"
      result = UsdaFoodApiService.new.foods_with_ingredient(ingredient)
      expect(result).to have_key("list")
      expect(result["list"]["total"]).to eq(531)
      expect(result["list"]["item"].first).to have_key("group")
      expect(result["list"]["item"].first).to have_key("name")
      expect(result["list"]["item"].first).to have_key("ndbno")
      expect(result["list"]["item"].first).to have_key("ds")
      expect(result["list"]["item"].first).to have_key("manu")
    end
  end
end
