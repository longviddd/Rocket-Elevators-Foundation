require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'

RSpec.describe "map management", :type => :request do
    describe "GET /building_id" do
        it "returns http success" do
            get "/maps/2"
            expect(response.status).to eq(200)
        end
        it "returns json" do
            get "/maps/90"
            expect(response.content_type).to eq("application/json")
        end
        it 'Should return code 404 because  building doesnt exist' do
            res = get '/maps/9999'
            expect(res).to eq 404
        end
          
    end
end