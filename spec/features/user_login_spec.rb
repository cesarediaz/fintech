require 'rails_helper'

RSpec.feature 'user use login', type: :feature do
  scenario 'sucessful', js: true do
    user = create(:user)

    visit(new_user_session_path)

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button 'Log in'

    within(:css, 'div.alert') do
      expect(page).to have_text('Signed in successfully.')
    end
  end

  scenario 'failure', js: true do
    create(:user)

    visit(new_user_session_path)

    fill_in 'user[email]', with: 'whatever@email.com'
    fill_in 'user[password]', with: 'failpassword'

    click_button 'Log in'

    within(:css, 'div.alert') do
      expect(page).to have_text('Invalid Email or password.')
    end
  end

  scenario 'needs to login in', js: true do
    visit '/'
    within(:css, 'div.alert') do
      expect(page).to have_text('You need to sign in or sign up before continuing.')
    end
  end
end
