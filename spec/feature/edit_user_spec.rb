require 'rails_helper'

RSpec.describe 'Edit user', type: :feature do
  context 'with invalid info' do
    before do
      User.create(
        name: 'Foo name',
        email: 'foo@gmail.com',
        password: 'f123456'
      )
    end

    let(:foo_user) { User.first }

    it 'returns form warning errors' do
      visit(edit_user_path(foo_user))

      click_on('Save changes')

      expect(page).to have_content('The form contains 2 errors.')
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Confirmation can't be blank")
      expect(page).to have_current_path(edit_user_path(foo_user))
    end
  end
end
