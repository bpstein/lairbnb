require 'rails_helper'
require 'web_helper'
require 'database_cleaner'

feature 'User can add a room' do 

  scenario 'user can visit new room path' do 
    visit '/'
    click_link('Sign Up')
    fill_in('Full Name', with: 'Test McTest')
    fill_in('Email', with: 'user@email.com')
    fill_in('Password', with: 'bananas')
    click_button('Sign up')
    wait_for { current_path }.to eq('/')
    # Need to wait for 10 sec because the toastr element obscures link element
    Capybara.using_wait_time 10 do
      click_on 'Become a Host'
      wait_for { current_path }.to eq('/rooms/new')
    end
  end

  scenario 'user cannot add room if not signed in' do 
    visit '/rooms'
    expect(page).to have_link('Become a Host')
    click_link('Become a Host')
    wait_for { current_path }.to eq('/login')
  end

end