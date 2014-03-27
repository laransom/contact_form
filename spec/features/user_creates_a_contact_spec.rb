require 'spec_helper'

feature 'User creates a contact', %q{
  As a site visitor
  I want to contact the site's staff
  So that I can tell them how awesome they are
} do

# Acceptance Criteria:
# * I must specify a valid email address
# * I must specify a subject
# * I must specify a description
# * I must specify a first name
# * I must specify a last name

  context 'with valid attributes' do
    it 'creates contact info with valid attributes' do
      visit '/contacts/new'

      fill_in 'Email', with: 'karazee@gmail.com'
      fill_in 'Subject', with: 'LaunchAcademy Rulezzz'
      fill_in 'Description', with: 'Crazy Kupcakes'
      fill_in 'First name', with: 'Franz'
      fill_in 'Last name', with: 'Ferdinand'
      click_on 'Create Contact'

      expect(page).to have_content 'Contact was successfully created'
    end
  end

  context 'with invalid attributes' do
    it 'sees errors for invalid attributes' do
      visit '/contacts/new'

      click_on 'Create Contact'

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Subject can't be blank"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end

    it 'sees errors for invalid email input' do
      visit '/contacts/new'

      fill_in 'Email', with: 'not an email'
      fill_in 'Subject', with: 'LaunchAcademy Rulezzz'
      fill_in 'Description', with: 'Crazy Kupcakes'
      fill_in 'First name', with: 'Franz'
      fill_in 'Last name', with: 'Ferdinand'
      click_on 'Create Contact'

      expect(page).to have_content 'Email is invalid'

    end
  end

end
