require 'rails_helper'

RSpec.describe 'User signup', type: :feature do
  context 'with invalid info' do
    it 'redirects to users/new' do
      visit(signup_path)

      fill_in('Name', with: '')
      fill_in('Email', with: '')

      click_on('Create my account')

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_current_path(users_path)
    end
  end

  context 'with valid info' do
    it 'redirects to users/new' do
      visit(signup_path)

      fill_in('Name', with: 'Foo name')
      fill_in('Email', with: 'foo@email.com')
      fill_in('Password', with: 'f12345')
      fill_in('Confirmation', with: 'f12345')

      expect{
        click_on('Create my account')
      }.to change{ User.count }.by(1)

      expect(page).to have_content('Welcome to welcome so welcome')
    end
  end
end
