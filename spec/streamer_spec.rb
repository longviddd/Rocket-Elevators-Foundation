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


