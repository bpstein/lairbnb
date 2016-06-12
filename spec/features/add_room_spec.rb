require 'rails_helper.rb'
require 'web_helpers.rb'

feature 'User can add a room' do 

  scenario 'user can visit new room path' do 
    sign_up 
    click_button 'List a space'
    expect(current_path).to eq '/rooms/new'
  end



end