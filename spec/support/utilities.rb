include ApplicationHelper

def full_title(page_title)
  base_title = "Media Tracker App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_login(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end


def log_in(user, options={})
  if options[:no_capybara]
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit login_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end