require_relative "room"
require "byebug"
class Hotel

    attr_reader :rooms

    def initialize(name, rooms)
        # debugger
        @name = name
        @rooms = create_rooms(rooms)
    end 

    def create_rooms(rooms)
        rooms_list = Hash.new

        rooms.each do |room_name, capacity|
            rooms_list[room_name] = Room.new(capacity)
        end 

        rooms_list
    end 

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end 

    def check_in(person, room)
        if self.room_exists?(room) 
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else 
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end            
    end 

    def has_vacancy?
        !@rooms.values.all?(&:full?)
    end 

    def list_rooms
        @rooms.each { |room_name, room| puts "#{room_name}.*#{room.available_space}"}
    end 
end
