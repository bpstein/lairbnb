require 'rails_helper'
require 'web_helper'

feature 'User can sign up' do 

  scenario 'user can sign up' do
    visit '/'
    click_link('Sign Up')
    fill_in('Full Name', with: 'Mr User')
    fill_in('Email', with: 'user@email.com')
    fill_in('Password', with: 'bananas')
    click_button('Sign up')
    wait_for { current_path }.to eq('/')
  end
end