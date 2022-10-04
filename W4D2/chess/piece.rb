class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        raise "Position out of bounds" unless board.valid_pos?(pos)
        @color = color 
    end 

    
end 