require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'
#test if user can go to manage account
describe 'go to manage account after logging in', type: :feature do
    context "test if user can go to manage account section" do
        it "login the user then go to manage account" do
            visit "admin/login"
            fill_in "user[email]", with: "nicolas.genest@codeboxx.biz"
            fill_in "user[password]", with: "password"
            click_button "Login"
            visit "users/1"
            expect(page).to have_content 'Email'
        end
    end
end