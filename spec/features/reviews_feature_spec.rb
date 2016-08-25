require 'rails_helper'
require 'web_helper'

feature 'Reviewing' do
  before do
      create_restaurant
  end

  scenario 'allows users to leave a review via a form' do
    visit '/restaurants'
    click_link 'Review Goodmans'
    fill_in 'Thoughts', with: 'Awesome'
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Awesome')
  end

end
