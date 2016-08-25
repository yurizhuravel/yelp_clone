require 'rails_helper'
require 'web_helper'

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
            create_restaurant
        end

        scenario 'display restaurants' do
            visit '/restaurants'
            expect(page).to have_content 'Goodmans'
            expect(page).not_to have_content 'No restaurants added yet'
        end
    end

    context 'creating restaurants' do
        before do
            sign_up
            visit '/restaurants'
            click_link 'Add a restaurant'
        end

        scenario 'shows user a form to fill, then creates a restaurant' do
            fill_in 'Name', with: 'Etsu'
            click_button 'Create Restaurant'
            expect(page).to have_content 'Etsu'
            expect(current_path).to eq '/restaurants'
        end

        scenario 'names shorter than 2 characters are not accepted' do
            fill_in 'Name', with: 'E'
            click_button 'Create Restaurant'
            expect(page).not_to have_css 'h2', text: 'E'
            expect(page).to have_content 'error'
        end
    end

    context 'viewing restaurants' do
        before do
          create_restaurant
        end

        scenario 'lets users view individual restaurants' do
            visit '/restaurants'
            click_link 'Goodmans'
            expect(page).to have_content 'Goodmans'
        end
    end

    context 'editing restaurants' do
      before do
          create_restaurant
      end

        scenario 'let a user edit a restaurant' do
            visit '/restaurants'
            click_link 'Edit Goodmans'
            fill_in 'Name', with: 'Goodmans Steakhouse'
            fill_in 'Description', with: 'Best steak in town'
            click_button 'Update Restaurant'
            expect(page).to have_content 'Goodmans Steakhouse'
            expect(page).to have_content 'Best steak in town'
            expect(current_path).to eq '/restaurants'
        end
    end

    context 'deleting restaurants' do
      before do
          create_restaurant
      end

        scenario 'removes a restaurant when a user clicks a delete link' do
            visit '/restaurants'
            click_link 'Delete Goodmans'
            expect(page).not_to have_content 'Goodmans'
            expect(page).to have_content 'Restaurant deleted successfully'
        end
    end
end
