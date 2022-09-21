require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |k,v|
            @rooms[k] = Room.new(v) 
        end
    end

    def name
        word_arr = @name.split(" ")
        new_word_arr = []
        word_arr.each {|word| new_word_arr << word.capitalize}
        new_word_arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        if rooms.keys.include?(room)
            true
        else
            false
        end
    end

    def check_in(person, room)
        require "byebug"
        if !room_exists?(room)
            p 'sorry, this room does not exist'
        else
            #debugger
            #rooms[room].add_occupant(person)
            if rooms[room].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        rooms.each_key {|k| return true if rooms[k].available_space != 0}
        false
    end

    def list_rooms
        rooms.each_key {|k| puts k + rooms[k].available_space.to_s}
    end
end
