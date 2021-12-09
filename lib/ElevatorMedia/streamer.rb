require 'http'
require 'json'
module ElevatorMedia
    class Streamer
        def initialize

        end
        def getContent
            response = Faraday.get 'https://api.openweathermap.org/data/2.5/weather' do |req|
                req.params['APPID'] = 'b845234be096337b67e90c784eced5aa'
                req.params['lat'] = '45.5017'
                req.params['lon'] = '73.5673'
                req.params['units'] = 'metric'
            end
            response_body = response.body
            response_json = JSON.parse(response_body)
            html = "<div>Current weather: #{response_json}</div>"
            puts html
            return html
        end
        
        
    end
end