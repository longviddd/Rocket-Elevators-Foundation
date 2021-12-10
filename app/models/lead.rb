class Lead < ApplicationRecord
    before_validation :sanitize_content, :on => :create
    has_one_attached :contact_attachment_file
    after_create :upload
    private
        def sanitize_content
            puts 'sanitizing'
            self.full_name = sanitize_field(self.full_name)
            self.company_name = sanitize_field(self.company_name)
            self.email = sanitize_field(self.email)
            self.phone = sanitize_field(self.phone)
            self.project_name = sanitize_field(self.project_name)
            self.project_description = sanitize_field(self.project_description)
            self.department_in_charge_of_the_elevators = sanitize_field(self.department_in_charge_of_the_elevators)
            self.message = sanitize_field(self.message)
        end
        def sanitize_field(field)
            ActionController::Base.helpers.sanitize(field, tags: [])
        end
    def attachment_path
    
        
    end

    def to_s
        "Lead #" + self.id.to_s
    end

    def upload
        Dropbox.new(self).call
    end

end
