require 'rails_helper'

RSpec.describe 'User searches for foods by ingredient' do
  it 'shows a count and list of foods with that ingredient' do
    WebMock.allow_net_connect!
    VCR.turn_off!
    visit '/'
    fill_in "q", with: "sweet potatoes"
    click_button "Search"

    expect(current_path).to eq('/foods')

    expect(page).to have_content("531 results")
    expect(page.all('.food_list').count).to eq(10)

    within(first('.food_list')) do
      expect(page).to have_content("some NDB number")
      expect(page).to have_content("some name")
      expect(page).to have_content("some food group")
      expect(page).to have_content("some data source")
      expect(page).to have_content("some manufacturer")
    end

    # TO DO: test that the 10 foods shown are sorted by relevance
  end
end