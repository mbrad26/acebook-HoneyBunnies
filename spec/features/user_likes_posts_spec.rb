require 'rails_helper'

feature 'User can likes posts', type: :feature do
  scenario 'a user likes a post' do
    #signs the user in
    user = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    expect(page).to have_content 'Log in'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    visit '/posts'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(page).to have_content 'Likes: 0'
    first(:button, 'Like Post')
    expect(page).to have_content 'Likes: 1'
  end
end
