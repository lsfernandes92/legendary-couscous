require 'rails_helper'

RSpec.describe 'Layout links', type: :feature do
  describe 'header links' do
    it 'home link should redirect to root path' do
      visit(root_url)

      click_link('Home')

      expect(page).to have_current_path(root_path)
    end

    it 'help link should redirect to help path' do
      visit(root_url)

      click_link('Help')

      expect(page).to have_current_path(help_path)
    end
  end

  describe 'footer links' do
    it 'about link should redirect to about path' do
      visit(root_url)

      click_link('About')

      expect(page).to have_current_path(about_path)
    end

    it 'contact link should redirect to contact path' do
      visit(root_url)

      click_link('Contact')

      expect(page).to have_current_path(contact_path)
    end
  end
end
