# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_11_035317) do

  create_table "active_admin_comments", options: "CREATE TABLE \"active_admin_comments\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"namespace\" varchar(255) DEFAULT NULL,\n  \"body\" text,\n  \"resource_type\" varchar(255) DEFAULT NULL,\n  \"resource_id\" bigint DEFAULT NULL,\n  \"author_type\" varchar(255) DEFAULT NULL,\n  \"author_id\" bigint DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_active_admin_comments_on_resource_type_and_resource_id\" (\"resource_type\",\"resource_id\"),\n  KEY \"index_active_admin_comments_on_author_type_and_author_id\" (\"author_type\",\"author_id\"),\n  KEY \"index_active_admin_comments_on_namespace\" (\"namespace\")\n)", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", options: "CREATE TABLE \"active_storage_attachments\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"name\" varchar(255) NOT NULL,\n  \"record_type\" varchar(255) NOT NULL,\n  \"record_id\" bigint NOT NULL,\n  \"blob_id\" bigint NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_active_storage_attachments_uniqueness\" (\"record_type\",\"record_id\",\"name\",\"blob_id\"),\n  KEY \"index_active_storage_attachments_on_blob_id\" (\"blob_id\"),\n  CONSTRAINT \"fk_rails_c3b3935057\" FOREIGN KEY (\"blob_id\") REFERENCES \"active_storage_blobs\" (\"id\")\n)", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "CREATE TABLE \"active_storage_blobs\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"key\" varchar(255) NOT NULL,\n  \"filename\" varchar(255) NOT NULL,\n  \"content_type\" varchar(255) DEFAULT NULL,\n  \"metadata\" text,\n  \"byte_size\" bigint NOT NULL,\n  \"checksum\" varchar(255) NOT NULL,\n  \"created_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_active_storage_blobs_on_key\" (\"key\")\n)", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "CREATE TABLE \"addresses\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"type_of_address\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"entity\" varchar(255) DEFAULT NULL,\n  \"number_and_street\" varchar(255) DEFAULT NULL,\n  \"suite_or_apartment\" varchar(255) DEFAULT NULL,\n  \"city\" varchar(255) DEFAULT NULL,\n  \"postal_code\" varchar(255) DEFAULT NULL,\n  \"country\" varchar(255) DEFAULT NULL,\n  \"notes\" text,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"longitude\" decimal(15,10) DEFAULT NULL,\n  \"latitude\" decimal(15,10) DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "type_of_address"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "longitude", precision: 15, scale: 10
    t.decimal "latitude", precision: 15, scale: 10
  end

  create_table "batteries", options: "CREATE TABLE \"batteries\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"building_id\" bigint DEFAULT NULL,\n  \"battery_type\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"employee_id\" bigint DEFAULT NULL,\n  \"Date_of_\" varchar(255) DEFAULT NULL,\n  \"date_of_last_inspection\" date DEFAULT NULL,\n  \"certificate_of_operations\" varchar(255) DEFAULT NULL,\n  \"information\" text,\n  \"notes\" text,\n  \"updated_at\" datetime NOT NULL,\n  \"date_of_commissioning\" date DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_batteries_on_building_id\" (\"building_id\"),\n  KEY \"index_batteries_on_employee_id\" (\"employee_id\"),\n  CONSTRAINT \"fk_rails_ceeeaf55f7\" FOREIGN KEY (\"employee_id\") REFERENCES \"employees\" (\"id\"),\n  CONSTRAINT \"fk_rails_fc40470545\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "building_id"
    t.string "battery_type"
    t.string "status"
    t.bigint "employee_id"
    t.string "Date_of_"
    t.date "date_of_last_inspection"
    t.string "certificate_of_operations"
    t.text "information"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.date "date_of_commissioning"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "CREATE TABLE \"building_details\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"building_id\" bigint DEFAULT NULL,\n  \"information_key\" varchar(255) DEFAULT NULL,\n  \"value\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_building_details_on_building_id\" (\"building_id\"),\n  CONSTRAINT \"fk_rails_51749f8eac\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "CREATE TABLE \"buildings\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"customer_id\" bigint DEFAULT NULL,\n  \"full_name_of_the_building_administrator\" varchar(255) DEFAULT NULL,\n  \"email_of_the_administrator_of_the_building\" varchar(255) DEFAULT NULL,\n  \"full_name_of_the_technical_contact_for_the_building\" varchar(255) DEFAULT NULL,\n  \"technical_contact_phone_for_the_building\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"address_id\" bigint DEFAULT NULL,\n  \"phone_number_of_the_building_administrator\" varchar(255) DEFAULT NULL,\n  \"technical_contact_email_for_the_building\" varchar(255) DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_buildings_on_customer_id\" (\"customer_id\"),\n  KEY \"index_buildings_on_address_id\" (\"address_id\"),\n  CONSTRAINT \"fk_rails_6dc7a885ab\" FOREIGN KEY (\"address_id\") REFERENCES \"addresses\" (\"id\"),\n  CONSTRAINT \"fk_rails_c29cbe7fb8\" FOREIGN KEY (\"customer_id\") REFERENCES \"customers\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "full_name_of_the_building_administrator"
    t.string "email_of_the_administrator_of_the_building"
    t.string "full_name_of_the_technical_contact_for_the_building"
    t.string "technical_contact_phone_for_the_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.string "phone_number_of_the_building_administrator"
    t.string "technical_contact_email_for_the_building"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "CREATE TABLE \"columns\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"column_type\" varchar(255) DEFAULT NULL,\n  \"number_of_floors_served\" int DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"information\" text,\n  \"notes\" text,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"battery_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_columns_on_battery_id\" (\"battery_id\"),\n  CONSTRAINT \"fk_rails_021eb14ac4\" FOREIGN KEY (\"battery_id\") REFERENCES \"batteries\" (\"id\")\n)", force: :cascade do |t|
    t.string "column_type"
    t.integer "number_of_floors_served"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "CREATE TABLE \"customers\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"user_id\" bigint DEFAULT NULL,\n  \"customer_creation_date\" date DEFAULT NULL,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"company_headquarters_address\" varchar(255) DEFAULT NULL,\n  \"full_name_of_the_company_contact\" varchar(255) DEFAULT NULL,\n  \"company_contact_phone\" varchar(255) DEFAULT NULL,\n  \"email_of_the_company_contact\" varchar(255) DEFAULT NULL,\n  \"company_description\" text,\n  \"technical_authority_phone_for_service\" varchar(255) DEFAULT NULL,\n  \"technical_manager_email_for_service\" varchar(255) DEFAULT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"address_id\" bigint DEFAULT NULL,\n  \"full_name_of_service_technical_authority\" varchar(255) DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_customers_on_user_id\" (\"user_id\"),\n  KEY \"index_customers_on_address_id\" (\"address_id\"),\n  CONSTRAINT \"fk_rails_3f9404ba26\" FOREIGN KEY (\"address_id\") REFERENCES \"addresses\" (\"id\"),\n  CONSTRAINT \"fk_rails_9917eeaf5d\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "user_id"
    t.date "customer_creation_date"
    t.string "company_name"
    t.string "company_headquarters_address"
    t.string "full_name_of_the_company_contact"
    t.string "company_contact_phone"
    t.string "email_of_the_company_contact"
    t.text "company_description"
    t.string "technical_authority_phone_for_service"
    t.string "technical_manager_email_for_service"
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.string "full_name_of_service_technical_authority"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "CREATE TABLE \"elevators\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"column_id\" bigint DEFAULT NULL,\n  \"serial_number\" varchar(255) DEFAULT NULL,\n  \"model\" varchar(255) DEFAULT NULL,\n  \"elevator_type\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT NULL,\n  \"Date_of_commissioning\" date DEFAULT NULL,\n  \"date_of_last_inspection\" date DEFAULT NULL,\n  \"certificate_of_inspection\" varchar(255) DEFAULT NULL,\n  \"information\" text,\n  \"notes\" text,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_elevators_on_column_id\" (\"column_id\"),\n  CONSTRAINT \"fk_rails_69442d7bc2\" FOREIGN KEY (\"column_id\") REFERENCES \"columns\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "column_id"
    t.string "serial_number"
    t.string "model"
    t.string "elevator_type"
    t.string "status"
    t.date "Date_of_commissioning"
    t.date "date_of_last_inspection"
    t.string "certificate_of_inspection"
    t.text "information"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "CREATE TABLE \"employees\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"first_name\" varchar(255) DEFAULT NULL,\n  \"last_name\" varchar(255) DEFAULT NULL,\n  \"function\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"user_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_employees_on_user_id\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_dcfd3d4fc3\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "interventions", options: "CREATE TABLE \"interventions\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"building_id\" bigint NOT NULL,\n  \"author\" bigint NOT NULL,\n  \"battery_id\" bigint NOT NULL,\n  \"column_id\" bigint DEFAULT NULL,\n  \"elevator_id\" bigint DEFAULT NULL,\n  \"start_intervention\" datetime DEFAULT NULL,\n  \"end_intervention\" datetime DEFAULT NULL,\n  \"result\" varchar(255) DEFAULT 'Incomplete',\n  \"report\" varchar(255) DEFAULT NULL,\n  \"status\" varchar(255) DEFAULT 'Pending',\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"customer_id\" bigint NOT NULL,\n  \"employee_id\" bigint DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_interventions_on_building_id\" (\"building_id\"),\n  KEY \"fk_rails_372877a32f\" (\"author\"),\n  KEY \"fk_fact_intervention_customer\" (\"customer_id\"),\n  KEY \"fk_fact_intervention_battery\" (\"battery_id\"),\n  KEY \"fk_fact_intervention_column\" (\"column_id\"),\n  KEY \"fk_fact_intervention_elevator\" (\"elevator_id\"),\n  KEY \"fk_intervention_employee\" (\"employee_id\"),\n  CONSTRAINT \"fk_fact_intervention_battery\" FOREIGN KEY (\"battery_id\") REFERENCES \"batteries\" (\"id\"),\n  CONSTRAINT \"fk_fact_intervention_column\" FOREIGN KEY (\"column_id\") REFERENCES \"columns\" (\"id\"),\n  CONSTRAINT \"fk_fact_intervention_customer\" FOREIGN KEY (\"customer_id\") REFERENCES \"customers\" (\"id\"),\n  CONSTRAINT \"fk_fact_intervention_elevator\" FOREIGN KEY (\"elevator_id\") REFERENCES \"elevators\" (\"id\"),\n  CONSTRAINT \"fk_intervention_employee\" FOREIGN KEY (\"employee_id\") REFERENCES \"employees\" (\"id\"),\n  CONSTRAINT \"fk_rails_372877a32f\" FOREIGN KEY (\"author\") REFERENCES \"employees\" (\"id\"),\n  CONSTRAINT \"fk_rails_911b4ef939\" FOREIGN KEY (\"building_id\") REFERENCES \"buildings\" (\"id\")\n)", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.bigint "author", null: false
    t.bigint "battery_id", null: false
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.datetime "start_intervention"
    t.datetime "end_intervention"
    t.string "result", default: "Incomplete"
    t.string "report"
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.bigint "employee_id"
    t.index ["author"], name: "fk_rails_372877a32f"
    t.index ["battery_id"], name: "fk_fact_intervention_battery"
    t.index ["building_id"], name: "index_interventions_on_building_id"
    t.index ["column_id"], name: "fk_fact_intervention_column"
    t.index ["customer_id"], name: "fk_fact_intervention_customer"
    t.index ["elevator_id"], name: "fk_fact_intervention_elevator"
    t.index ["employee_id"], name: "fk_intervention_employee"
  end

  create_table "leads", options: "CREATE TABLE \"leads\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"full_name\" varchar(255) DEFAULT NULL,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"phone\" varchar(255) DEFAULT NULL,\n  \"project_name\" varchar(255) DEFAULT NULL,\n  \"project_description\" text,\n  \"department_in_charge_of_the_elevators\" varchar(255) DEFAULT NULL,\n  \"message\" text,\n  \"updated_at\" datetime NOT NULL,\n  \"date_of_creation\" date DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "full_name"
    t.string "company_name"
    t.string "email"
    t.string "phone"
    t.string "project_name"
    t.text "project_description"
    t.string "department_in_charge_of_the_elevators"
    t.text "message"
    t.datetime "updated_at", null: false
    t.date "date_of_creation"
  end

  create_table "login_activities", options: "CREATE TABLE \"login_activities\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"scope\" varchar(255) DEFAULT NULL,\n  \"strategy\" varchar(255) DEFAULT NULL,\n  \"identity\" varchar(255) DEFAULT NULL,\n  \"success\" tinyint(1) DEFAULT NULL,\n  \"failure_reason\" varchar(255) DEFAULT NULL,\n  \"user_type\" varchar(255) DEFAULT NULL,\n  \"user_id\" bigint DEFAULT NULL,\n  \"context\" varchar(255) DEFAULT NULL,\n  \"ip\" varchar(255) DEFAULT NULL,\n  \"user_agent\" text,\n  \"referrer\" text,\n  \"city\" varchar(255) DEFAULT NULL,\n  \"region\" varchar(255) DEFAULT NULL,\n  \"country\" varchar(255) DEFAULT NULL,\n  \"latitude\" float DEFAULT NULL,\n  \"longitude\" float DEFAULT NULL,\n  \"created_at\" datetime DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_login_activities_on_identity\" (\"identity\"),\n  KEY \"index_login_activities_on_user_type_and_user_id\" (\"user_type\",\"user_id\"),\n  KEY \"index_login_activities_on_ip\" (\"ip\")\n)", force: :cascade do |t|
    t.string "scope"
    t.string "strategy"
    t.string "identity"
    t.boolean "success"
    t.string "failure_reason"
    t.string "user_type"
    t.bigint "user_id"
    t.string "context"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "city"
    t.string "region"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at"
    t.index ["identity"], name: "index_login_activities_on_identity"
    t.index ["ip"], name: "index_login_activities_on_ip"
    t.index ["user_type", "user_id"], name: "index_login_activities_on_user_type_and_user_id"
  end

  create_table "quotes", options: "CREATE TABLE \"quotes\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"building_type\" varchar(255) DEFAULT NULL,\n  \"amount_elevators\" varchar(255) DEFAULT NULL,\n  \"product_line\" varchar(255) DEFAULT NULL,\n  \"installation_fees\" varchar(255) DEFAULT NULL,\n  \"total_cost\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"amount_floors\" varchar(255) DEFAULT NULL,\n  \"amount_basements\" varchar(255) DEFAULT NULL,\n  \"amount_parking_spots\" varchar(255) DEFAULT NULL,\n  \"maximum_occupancy\" varchar(255) DEFAULT NULL,\n  \"amount_apartments\" varchar(255) DEFAULT NULL,\n  \"amount_companies\" varchar(255) DEFAULT NULL,\n  \"amount_corporations\" varchar(255) DEFAULT NULL,\n  \"business_hours\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"company_name\" varchar(255) DEFAULT NULL,\n  \"full_name\" varchar(255) DEFAULT NULL,\n  \"phone\" varchar(255) DEFAULT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.string "building_type"
    t.string "amount_elevators"
    t.string "product_line"
    t.string "installation_fees"
    t.string "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amount_floors"
    t.string "amount_basements"
    t.string "amount_parking_spots"
    t.string "maximum_occupancy"
    t.string "amount_apartments"
    t.string "amount_companies"
    t.string "amount_corporations"
    t.string "business_hours"
    t.string "email"
    t.string "company_name"
    t.string "full_name"
    t.string "phone"
  end

  create_table "users", options: "CREATE TABLE \"users\" (\n  \"id\" bigint NOT NULL AUTO_INCREMENT,\n  \"first_name\" varchar(255) DEFAULT NULL,\n  \"last_name\" varchar(255) DEFAULT NULL,\n  \"email\" varchar(255) DEFAULT NULL,\n  \"password\" varchar(255) DEFAULT NULL,\n  \"token\" varchar(255) DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"encrypted_password\" varchar(255) NOT NULL DEFAULT '',\n  \"reset_password_token\" varchar(255) DEFAULT NULL,\n  \"reset_password_sent_at\" datetime DEFAULT NULL,\n  \"remember_created_at\" datetime DEFAULT NULL,\n  \"function\" varchar(255) DEFAULT NULL,\n  \"confirmation_token\" varchar(255) DEFAULT NULL,\n  \"confirmed_at\" datetime DEFAULT NULL,\n  \"confirmation_sent_at\" datetime DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_users_on_email\" (\"email\"),\n  UNIQUE KEY \"index_users_on_reset_password_token\" (\"reset_password_token\"),\n  UNIQUE KEY \"index_users_on_confirmation_token\" (\"confirmation_token\")\n)", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "function"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
  add_foreign_key "interventions", "batteries", name: "fk_fact_intervention_battery"
  add_foreign_key "interventions", "buildings"
  add_foreign_key "interventions", "columns", name: "fk_fact_intervention_column"
  add_foreign_key "interventions", "customers", name: "fk_fact_intervention_customer"
  add_foreign_key "interventions", "elevators", name: "fk_fact_intervention_elevator"
  add_foreign_key "interventions", "employees", column: "author"
  add_foreign_key "interventions", "employees", name: "fk_intervention_employee"
end
