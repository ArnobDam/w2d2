class Room
  
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        if occupants.length < capacity
            false
        else
            true
        end
    end

    

end