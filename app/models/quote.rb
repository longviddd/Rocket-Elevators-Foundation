# frozen_string_literal: true

class Quote < ApplicationRecord
    before_validation :sanitize_content, :on => :create
    private
        def sanitize_content
            puts 'sanitizing'
            self.building_type = sanitize_field(self.building_type)
            self.product_line = sanitize_field(self.product_line)
            self.amount_elevators = sanitize_field(self.amount_elevators)
            self.installation_fees = sanitize_field(self.installation_fees)
            self.total_cost = sanitize_field(self.total_cost)
            self.amount_floors = sanitize_field(self.amount_floors)
            self.amount_basements = sanitize_field(self.amount_basements)
            self.amount_parking_spots = sanitize_field(self.amount_parking_spots)
            self.maximum_occupancy = sanitize_field(self.maximum_occupancy)
            self.amount_apartments = sanitize_field(self.amount_apartments)
            self.amount_companies = sanitize_field(self.amount_companies)
            self.amount_corporations = sanitize_field(self.amount_corporations)
            self.business_hours = sanitize_field(self.business_hours)
            self.email = sanitize_field(self.email)
            self.company_name = sanitize_field(self.company_name)
            self.full_name = sanitize_field(self.full_name)
            self.phone = sanitize_field(self.phone)
        end
        def sanitize_field(field)
            ActionController::Base.helpers.sanitize(field, tags: [])
        end
end
