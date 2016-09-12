require 'rails_helper'

RSpec.feature 'user use login', type: :feature do
  scenario 'sucessful', js: true do
    user = create(:user)

    visit(new_user_session_path)

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button 'Log in'

    expect(page).to have_text("Welcome #{user.email}")
  end
end
