require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'
#test login panel
describe 'login into the page as an admin', type: :feature do
    context "test if login panel work" do
        it "login the user" do
            visit "admin/login"
            fill_in "user[email]", with: "nicolas.genest@codeboxx.biz"
            fill_in "user[password]", with: "password"
            click_button "Login"
        end
    end
end
describe 'go to manage account after logging in', type: :feature do
    context "test if user can go to manage account section" do
        it "login the user then go to manage account" do
            visit "admin/login"
            fill_in "user[email]", with: "nicolas.genest@codeboxx.biz"
            fill_in "user[password]", with: "password"
            click_button "Login"
            visit "admin/edit"
            expect(page).to have_content 'Email'
        end
    end
end
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
