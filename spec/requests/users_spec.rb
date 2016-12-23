require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "the signin process", :type => :feature do
    before :each do
      User.create(username: 'user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
    end

    it "signs me in" do
      visit '/login'
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: 'password'
      click_button 'Login'
      expect(page).to have_content 'Logged in successfully'
    end

    it "doesn't sign in with wrong password" do
      visit '/login'
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: 'pass'
      click_button 'Login'
      expect(page).to have_content 'Bad email or password.'
    end
  end
end
