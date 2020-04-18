require 'rails_helper'

feature 'Login page: Login with invalid email or password' do
  background do
    visit new_user_session_path
    FactoryBot.create(:user, admin: true)
  end

  scenario 'Show invalid email or password error to user' do
    error_message = 'Invalid Email or password.'
    fill_in('Email', with: 'wrong_email@example.com')
    fill_in('Password', with: 'wrong_password')
    click_button('Log in')
    expect(page).to have_content(error_message)
  end
end

feature 'Login page: valid credentials' do
  background do
    visit new_user_session_path
    FactoryBot.create(:user, admin: true)
  end

  context 'Log in as user' do
    let!(:user) { FactoryBot.create(:user) }

    scenario 'Show successful login alert and redirect to home page' do
      alert = 'Signed in successfully.'
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_button('Log in')
      expect(page).to have_content(alert)
      expect(page).to have_current_path(root_path)
    end
  end

end
