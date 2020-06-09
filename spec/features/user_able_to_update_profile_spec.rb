require 'rails_helper'

feature 'User update account details', type: :feature do

  scenario 'a user can update an account details' do
    user = User.create(fname: 'John', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/'
    click_link 'Sign In'
    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    click_link 'Profile'
    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content 'John Doe john.doe@example.com'

    click_link 'Edit Profile'

    expect(current_path).to eq "/users/#{user.id}/edit"

    fill_in 'user[fname]', with: 'Bill'
    fill_in 'user[lname]', with: 'Johnson'
    fill_in 'user[email]', with: 'bill.doe@example.com'
    fill_in 'user[password]', with: 'password123'
    fill_in 'user[password_confirmation]', with: 'password123'
    click_button 'Update Profile'

    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content 'Bill Johnson bill.doe@example.com'
    expect(page).to have_content 'Profile Updated'
  end

  context 'when user params not valid' do
    scenario 'a user can not update an account details with not valid inputs' do
      user = User.create(fname: 'John', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

      visit '/'
      click_link 'Sign In'
      fill_in 'user[email]', with: 'john.doe@example.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Sign in'

      click_link 'Profile'
      expect(current_path).to eq "/users/#{user.id}"
      expect(page).to have_content 'John Doe john.doe@example.com'

      click_link 'Edit Profile'

      expect(current_path).to eq "/users/#{user.id}/edit"

      fill_in 'user[fname]', with: 'Bill'
      fill_in 'user[lname]', with: 'Johnson'
      fill_in 'user[email]', with: 'bill.doe_example.com'
      fill_in 'user[password]', with: '123'
      fill_in 'user[password_confirmation]', with: '123'
      click_button 'Update Profile'

      expect(current_path).to eq "/users/#{user.id}/edit"
      expect(find_field('user[fname]').value).to eq 'John'
      expect(find_field('user[lname]').value).to eq 'Doe'
      expect(find_field('user[email]').value).to eq 'john.doe@example.com'
      expect(page).to have_content 'Provided details are not valid'
    end
  end
end
