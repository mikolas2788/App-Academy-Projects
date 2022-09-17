require "byebug"

class Board
    
    attr_reader :size

    def initialize(board_length)
        @board_length = board_length
        @grid = Array.new(board_length) { Array.new(board_length, :N) }
        @size = board_length * board_length
    end     

    def [](arr)
        @grid[arr[0]][arr[1]]
    end 

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end 

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end 

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else 
            self[pos] = :X
            return false
        end 
    end 

    def place_random_ships
        
        until num_ships == @size / 4
            y_coordinate = rand(@board_length)
            x_coordinate = rand(@board_length)
            self[[y_coordinate, x_coordinate]] = :S
        end 
    end 

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map { |coordinate| coordinate == :S ? :N : coordinate }
        end 
    end 

    def self.print_grid(grid)
        grid.each do |row| 
            puts row.map { |coordinate| coordinate.to_s }.join(" ")
        end 
    end 

    def cheat
        Board.print_grid(@grid)
    end 

    def print
        Board.print_grid(self.hidden_ships_grid)
    end 
end
