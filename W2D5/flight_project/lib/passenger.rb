class Passenger

    attr_reader :name
    
    def initialize(name)
        @name = name
        @flight_numbers = []
    end 

    def has_flight?(flight_number)
        @flight_numbers.include?(standardize_flight_number(flight_number))
    end 

    def add_flight(flight_nunber)
        if !self.has_flight?(flight_number)
            @flight_numbers << standardize_flight_number(flight_number)
            return false
        end 

        true
    end 

    def standardize_flight_number(flight_number)
        split_flight = flight_number.split("")
        split_flight.map { |ele| ele.upcase if ele.is_a?(String) }.join(" ")
    end 
end 