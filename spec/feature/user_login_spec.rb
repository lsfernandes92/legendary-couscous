require 'rails_helper'
require 'support/login_helper'

RSpec.describe 'User login', type: :feature do
  include LoginHelper

  context 'with invalid info' do
    it 'redirects to sessions/new' do
      visit(login_path)

      fill_in('Email', with: '')
      fill_in('Password', with: '')

      click_on('Login')

      expect(page).to have_content('Invalid email/password combination')
      expect(page).to have_current_path(login_path)
    end
  end

  context 'with valid info' do
    before do
      User.create(
        name: 'Foo name',
        email: 'foo@gmail.com',
        password: 'f123456'
      )
    end

    let(:user) { User.first }

    it 'login and redirects to users/:id' do
      log_foo_user_in

      expect(page).to have_content('Foo name')
      expect(page).to have_content('Users')
      expect(page).to have_content('Profile')
      expect(page).to have_content('Settings')
      expect(page).to have_content('Log out')
      expect(page).to have_current_path(user_path(user))
    end

    it 'login and logout in sequence' do
      log_foo_user_in

      click_on('Log out')

      expect(page).not_to have_content('Foo name')
      expect(page).not_to have_content('Users')
      expect(page).not_to have_content('Profile')
      expect(page).not_to have_content('Settings')
      expect(page).not_to have_content('Log out')
      expect(page).to have_current_path(root_url)
    end
  end
end
