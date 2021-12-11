require 'rails_helper'
require 'ElevatorMedia/streamer.rb'
require 'webmock'
RSpec.describe Intervention, type: :model do
    context 'test if intervention can save normally' do
        it 'ensures that intervention can save normally' do
            intervention = Intervention.new(building_id: 6, author: 1, battery_id: 10, column_id: 41, elevator_id: 141, employee_id: 3, created_at: DateTime.now, updated_at: DateTime.now, customer_id: 4).save
            expect(intervention).to eq(true)
        end
    end
    context 'test if intervention allow null customer id' do
        it 'ensures that intervention requires customer id' do
            intervention = Intervention.new(building_id: 6, author: 1, battery_id: 10, column_id: 41, elevator_id: 141, employee_id: 3, created_at: DateTime.now, updated_at: DateTime.now).save
            expect(intervention).to eq(false)
        end
    end
    context 'test if intervention allow null building id' do
        it 'ensures that intervention requires building id' do
            intervention = Intervention.new(customer_id: 4, author: 1, battery_id: 10, column_id: 41, elevator_id: 141, employee_id: 3, created_at: DateTime.now, updated_at: DateTime.now).save
            expect(intervention).to eq(false)
        end
    end
    context 'test if intervention allow null author' do
        it 'ensures that intervention requires author' do
            intervention = Intervention.new(customer_id: 4, battery_id: 10, column_id: 41, elevator_id: 141, employee_id: 3, created_at: DateTime.now, updated_at: DateTime.now, building_id: 6).save
            expect(intervention).to eq(false)
        end
    end
    context 'test if intervention allow null battery' do
        it 'ensures that intervention requires battery id' do
            intervention = Intervention.new(building_id: 6, author: 1, column_id: 41, elevator_id: 141, employee_id: 3, created_at: DateTime.now, updated_at: DateTime.now, customer_id: 4).save
            expect(intervention).to eq(false)
        end
    end
    
    
end