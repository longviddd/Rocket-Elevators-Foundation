class AddForeignKeyFactIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :customer_id, :bigint
    add_column :interventions, :employee_id, :bigint
    add_foreign_key :interventions, :employees, column: :author
    add_foreign_key :interventions, :customers, name: "fk_fact_intervention_customer"
    add_foreign_key :interventions, :batteries,  name: "fk_fact_intervention_battery"
    add_foreign_key :interventions, :columns,  name: "fk_fact_intervention_column"
    add_foreign_key :interventions, :elevators,  name: "fk_fact_intervention_elevator"
    add_foreign_key :interventions, :employees, column: :employee_id, name: "fk_intervention_employee"
  end
end
