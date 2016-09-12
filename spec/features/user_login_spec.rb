require 'rails_helper'

RSpec.feature 'user use login', type: :feature do
  before(:each) do
    login_as create(:user)
  end

  scenario 'index', js: true do
    user = User.last
    visit(root_path)

    expect(page).to have_text("Welcome #{user.email}")
  end
end
