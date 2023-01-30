require 'rails_helper'

RSpec.describe 'Sessions create' do
  let!(:user) { create :user }

  before :each do
    visit root_path
  end

  describe 'has correct routing' do
    it 'routes to dashboard' do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Login'

      expect(current_path).to eq dashboard_path(user)
    end
  end
end
