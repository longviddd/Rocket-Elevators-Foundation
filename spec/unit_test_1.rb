require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'
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
