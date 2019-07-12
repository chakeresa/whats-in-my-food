require 'rails_helper'

RSpec.describe 'User searches for foods by ingredient' do
  it 'shows a count and list of foods with that ingredient' do
    VCR.use_cassette('user_searches_for_foods_by_ingredient', record: :new_episodes) do
      visit '/'
      fill_in "q", with: "sweet potatoes"
      click_button "Search"

      expect(current_path).to eq('/foods')

      expect(page).to have_content("531 results")
      expect(page.all('.food_list').count).to eq(10)
      # a cleaner way of writing this ^ is below
      expect(page).to have_css('.food_list', count: 10)

      within(first('.food_list')) do
        # consider just searching expect(page).to have_css('.food_list-ndb_number') instead of specifying a particular result -- less fragile
        expect(first('.food_list-ndb_number')).to have_content("45094945")
        expect(first('.food_list-name')).to have_content("ONE POTATO TWO POTATO, PLAIN JAYNES, SWEET POTATO CHIPS, UPC: 785654000544")
        expect(first('.food_list-food_group')).to have_content("Branded Food Products Database")
        expect(first('.food_list-data_source')).to have_content("LI")
        expect(first('.food_list-manufacturer')).to have_content("Dieffenbach's Potato Chips")
      end

      # Note: the API automatically sorts by relevance (https://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md)
    end
  end

  it 'doesnt error out if no foods found with that ingredient' do
    VCR.use_cassette('user_searches_for_weird_food', record: :new_episodes) do
      visit '/'
      fill_in "q", with: "adfsadfasdfasf"
      click_button "Search"

      expect(current_path).to eq('/foods')
      expect(page).to have_content("0 results")
      expect(page).to_not have_css('.food_list')
    end
  end
end