class Human

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end     

    def get_position
        p "Enter a coordinate such as '1 2'"
        input = gets.chomp.split
    end 
end 