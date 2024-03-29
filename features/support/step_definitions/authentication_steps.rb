Given "I am logged in as an admin" do
  create_admin_account
  visit "/admin/sites/1" # stupid phantomjs hates double redirects a second time :(
  fill_in "Email", with: "admin@riverwest24.com"
  fill_in "Password", with: "secret"
  click_button "Login"
  step 'I am on the admin overview page'
end

def create_admin_account
  user = @site.users.where(email: "admin@riverwest24.com").first_or_initialize
  user.update! FactoryBot.attributes_for(:user, {
    first_name: "Admin",
    last_name: "Account",
    email: "admin@riverwest24.com",
    password: "secret",
    admin: true,
  })
end

Given "I am logged in as {string}" do |email|
  visit "/"
  click_link "Login"
  fill_in "Email", with: email
  fill_in "Password", with: "secret"
  click_button "Login"
end

