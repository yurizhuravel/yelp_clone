def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end

def sign_in
  visit '/users/sign_in'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  click_button 'Sign in'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

def create_restaurant
  sign_up
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'Goodmans'
  click_button 'Create Restaurant'
end
