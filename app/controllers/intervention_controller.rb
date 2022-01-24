class InterventionController < ApplicationController
    def fact_intervention_form_params
        params.permit(:customer_id, :building_id, :battery_id, :column_id, :report, :employee_id, :elevator_id)
    end
    def getCustomer
        customer = Customer.find(params[:customer_id])
        buildings = Building.where(customer_id: params[:customer_id])
        @buildingArray = Array.new
        buildings.each do |building|
            @buildingArray << {
                :id => building.id,
                :name => building.full_name_of_the_building_administrator
            }
            puts(building.id)
        end
        @buildingArray = @buildingArray.to_json
        puts @buildingArray
        render json: @buildingArray
    end
    def getBuilding
        batteries = Battery.where(building_id: params[:building_id])
        @batteryArray = Array.new
        batteries.each do |battery|
            @batteryArray << {
                :id => battery.id
            }
            puts battery.id
        end
        @batteryArray = @batteryArray.to_json
        render json: @batteryArray
    end
    def getBattery
        columns = Column.where(battery_id: params[:battery_id])
        @columnArray = Array.new
        columns.each do |column|
            @columnArray << {
                :id => column.id
            }
            puts column.id
        end
        @columnArray = @columnArray.to_json
        render json: @columnArray
    end
    def getColumn
        elevators = Elevator.where(column_id: params[:column_id])
        @elevatorArray = Array.new
        elevators.each do |elevator|
            @elevatorArray << {
                :id => elevator.id
            }
            puts elevator.id
        end
        @elevatorArray = @elevatorArray.to_json
        render json: @elevatorArray
    end
    def submit
        @intervention = Intervention.new(
            building_id: params[:building_id],
            author: current_user.employees[0].id,
            customer_id: params[:customer_id],
            battery_id: params[:battery_id],
            column_id: params[:column_id],
            elevator_id: params[:elevator_id],
            report: params[:report],
            employee_id: params[:employee_id]
        )
        if @intervention.save
            company_name = Customer.find(params[:customer_id]).company_name
            request_name = current_user.employees[0].first_name
            report = params[:report]
            building_id = params[:building_id]
            battery_id = params[:battery_id]
            column_string = ""
            elevator_string = ""
            if params[:column_id].blank? == false
                column_string = "at column #{params[:column_id]}"
            else
                column_string = ""
            end
            if params[:elevator_id].blank? == false
                elevator_string = "at elevator #{params[:elevator_id]}"
            else
                elevator_string = ""
            end
            if params[:employee_id].blank? == false
                employee_string = "assigned to employee #{params[:employee_id]}"
            else
                employee_string = ""
            end
            
            # ZendeskAPI::Ticket.create!(@client, 
            #     :subject => "Intervention from #{company_name}",
            #     :requester => {"name": request_name},
            #     :comment => { :value => 
            #      "There's an intervention from company #{company_name}.
            #     The intervention happens at building #{building_id}, at battery #{battery_id} #{column_string} #{elevator_string} #{employee_string}
            #       Report: #{report}"},
            #     :type => "question",  
            #     :priority => "urgent")
            # Trial account ran out 
        end
        
    end
end