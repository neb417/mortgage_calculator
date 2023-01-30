require 'rails_helper'

RSpec.describe 'landing index' do
  it 'returns as successful response' do
    visit root_path

    expect(page).to have_content('Welcome to the Page')
  end
end
