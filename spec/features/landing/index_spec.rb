require 'rails_helper'

RSpec.describe 'landing index' do
  let!(:user) { create :user }

  before :each do
    visit root_path
  end

  describe 'contents' do
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
    end
  end

  describe 'buttons and link routing' do
    it 'links to new user' do
      click_on 'Sign Up'

      expect(current_path).to eq new_user_path
    end

    it 'logs into dashboard' do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Login'

      expect(current_path).to eq dashboard_path(user)
    end
  end

  # describe 'sad path' do
  #   it 'must have an email entry' do
  #     click_on 'Login'
  #     expect(current_path).to eq root_path
  #   end
  # end
end
