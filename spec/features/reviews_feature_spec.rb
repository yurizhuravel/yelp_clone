require 'rails_helper'

feature 'Reviewing' do
  before { Restaurant.create name: 'Costa' }

  scenario 'allows users to leave a review via a form' do
    visit '/restaurants'
    click_link 'Review Costa'
    fill_in 'Thoughts', with: 'Not quite there anymore'
    select '4', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Not quite there anymore')
  end

end
