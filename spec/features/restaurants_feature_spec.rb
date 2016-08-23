require 'rails_helper'

feature 'Restaurants' do

  context 'when no restaurants were added' do
    scenario 'should ask to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants added yet'
      expect(page).to have_button 'Add a restaurant'
    end
  end

  context 'when restaurants have been added' do
    before do
      Restaurant.create(name: 'Goodmans')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'Goodmans'
      expect(page).not_to have_content 'No restaurants added yet'
    end
  end
end
