require 'rails_helper'

RSpec.describe 'landing index' do
  before :each do
    visit root_path
  end
  it 'returns as successful response' do
    expect(page).to have_content('Welcome to the Page')
  end

  it 'has form to login' do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Login')
  end

  it 'has link to register new user' do
    expect(page).to have_content("Don't have an account?")
    expect(page).to have_link('Sign Up')

    click_on 'Sign Up'

    expect(current_path).to eq new_user_path
  end
end
