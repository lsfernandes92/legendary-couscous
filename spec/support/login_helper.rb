module LoginHelper
  def log_foo_user_in
    visit(login_path)

    fill_in('Email', with: 'foo@gmail.com')
    fill_in('Password', with: 'f123456')

    click_on('Login')
  end
end
