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

  scenario 'failure', js: true do
    user = create(:user)

    visit(new_user_session_path)

    fill_in 'user[email]', with: 'whatever@email.com'
    fill_in 'user[password]', with: 'failpassword'

    click_button 'Log in'

    expect(page).not_to have_text('Sign out')
    expect(page).to have_text('Please sign in')
  end
end
