require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'
describe 'logout button exists after logging in', type: :feature do
    context "test if the logout button exists when user logged in" do
        it "login the user then go to home page" do
            visit "admin/login"
            fill_in "user[email]", with: "nicolas.genest@codeboxx.biz"
            fill_in "user[password]", with: "password"
            click_button "Login"
            visit "/"
            expect(page).to have_content 'Logout'
        end
    end
end