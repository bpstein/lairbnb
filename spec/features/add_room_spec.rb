require 'rails_helper.rb'
require 'web_helpers.rb'

feature 'User can add a room' do 

  scenario 'user can visit new room path' do 
    visit '/'
    click_link('Sign Up')
    fill_in('Full Name', with: 'Test McTest')
    fill_in('Email', with: 'user@email.com')
    fill_in('Password', with: 'bananas')
    click_button('Sign up')
    click_link('List a space')
    # expect(current_path).to eq '/rooms/new'
  end

  scenario 'user cannot add room if not signed in' do 
    visit '/rooms'
    click_link('List a space')
    expect(page).to have_link('List a space')
    expect(current_path).to eq '/login'
  end

end