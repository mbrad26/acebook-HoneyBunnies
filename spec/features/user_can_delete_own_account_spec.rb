require 'rails_helper'

feature 'User account delete' do
  scenario 'a user can delete his acoount' do
    user = User.create(fname: 'John', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/'

    click_link 'Sign In'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    click_link 'Profile'
    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content 'John Doe john.doe@example.com'

    click_link 'Delete Account'

    expect(current_path).to eq '/'
    expect(page).to have_content 'Account deleted successfully'
  end
end
