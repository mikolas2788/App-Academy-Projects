require_relative "piece.rb"
require "byebug"
class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
    end 

    def [](pos)
        raise "Position out of bounds" unless self.valid_pos?(pos)
        row, column = pos
        grid[row][column]
    end 
    
    def []=(pos, piece)
        raise "Position out of bounds" unless self.valid_pos?(pos)
        row, column = pos 
        grid[row][column] = piece 
    end 
    
    def valid_pos?(pos)
        pos.all? do |coord| 
            coord >= 0 && coord < 8
        end 
    end 

    def empty?(pos)
        self[pos].empty?
    end 
    
    def add_piece(pos, piece)
        raise "Position out of bounds" unless self.valid_pos?(pos)
        self[pos] = piece
    end 
end 