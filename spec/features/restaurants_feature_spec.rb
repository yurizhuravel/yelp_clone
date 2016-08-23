require 'rails_helper'

feature 'Restaurants' do

  context 'when no restaurants were added' do
    scenario 'should ask to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants added yet'
      expect(page).to have_link 'Add a restaurant'
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

  context 'creating restaurants' do
    scenario 'shows user a form to fill, then creates a restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Etsu'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Etsu'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:etsu){ Restaurant.create(name:'Etsu') }

    scenario 'lets users view individual restaurants' do
      visit '/restaurants'
      click_link 'Etsu'
      expect(page).to have_content 'Etsu'
    end
  end

  context 'editing restaurants' do

    before { Restaurant.create name: 'Etsu', description: 'Cheap fresh sushi' }

    scenario 'let a user edit a restaurant' do
     visit '/restaurants'
     click_link 'Edit Etsu'
     fill_in 'Name', with: 'Etsu Sushi'
     fill_in 'Description', with: 'Cheap fresh sushi'
     click_button 'Update Restaurant'
     expect(page).to have_content 'Etsu Sushi'
     expect(page).to have_content 'Cheap fresh sushi'
     expect(current_path).to eq '/restaurants'
    end

  end

  context 'deleting restaurants' do

    before { Restaurant.create name: 'KFC', description: 'Deep fried goodness' }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

  end

end
