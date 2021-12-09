# Link to the REST API: https://github.com/longviddd/Rocket-Elevators-Foundation-REST
# Link to the GRAPHQL: https://github.com/longviddd/Rocket_Elevator_Graphql
# Dependency: 
- Ruby
- Rails
- MySQL
- PostgreSQL
# API: 
- OpenWeatherAPI
- Recaptcha
- IBM Watson
- Zendesk API
- Dropbox API
- Twilio API
- Google Map API
- Slack API
- Sendgrid API
# Commands / Steps to run the app: 
- Create your own database.yml in config folder connected to a postgreSQL database and a MySQL database
- Create your own application.yml file in config folder containing all the needed API keys. You can also contact me to get mine to test it out
- Inside your MySQL database, create the database specified in your database.yml
- Run the following commands: 
1) rake final:setup (this will do everything: dropping the database, recreating the database, migrate the database, seed the database with fake data and feed the datawarehouse with data from the MySQL database)
# URL to the deployed website: https://longngelevator.online/



# Access to the Intervention Form: 
1) Go to the admin panel by accessing: longngelevator.online/admin
2) Login using an admin account: Example would be: nicolas.genest@codeboxx.biz/password or martin.chantal@codeboxx.biz/password
3) There will be an intervention form on the navbar. You can also access it by going to: longngelevator.online/admin/intervention
