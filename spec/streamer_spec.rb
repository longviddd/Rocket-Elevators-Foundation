require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'

#test elevator media

describe ElevatorMedia::Streamer, :type => :feature do
    #test if elevatormedia return correct type
    context "Initialize Streamer" do
        it "Streamer is initialized and is of correct type" do
            streamer = ElevatorMedia::Streamer.new
            expect(streamer).to be_a(ElevatorMedia::Streamer)
        end
    end
    #test if getContent can be called
    context "getContent responding" do
        it "should call getContent method" do
            streamer = ElevatorMedia::Streamer.new
            expect(streamer).to respond_to(:getContent)
        end
    end
    #test if get context return a string type html
    context "getContext return html string" do
        it "should return html string" do
            streamer = ElevatorMedia::Streamer.new
            content = streamer.getContent()
            expect(content).to be_kind_of String
        end
    end
    #test if getContent is a GET request that return value
    context 'test get method with getContent' do
        it 'should use Faraday for the get request and get a valid response' do
            faraday_response = double('faraday_response')
            expect(Faraday).to receive(:get).with("https://api.openweathermap.org/data/2.5/weather") {faraday_response}
            allow(faraday_response).to receive(:body) {"{}"}
            streamer = ElevatorMedia::Streamer.new
            streamer.getContent()
        end
    end
    
end

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
