require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetRequester

    @@persons_arr = []
    @@persons_hash = {}
    # @@final_arr = []

    def initialize(string)
        @URL = string
    end

    def get_response_body
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        people = JSON.parse(self.get_response_body)
        
        @@persons = people.each_with_index do |person, index|
            @@persons_arr.clear
            @@persons_arr << person[index]
        end
        @@persons
    end
    
end