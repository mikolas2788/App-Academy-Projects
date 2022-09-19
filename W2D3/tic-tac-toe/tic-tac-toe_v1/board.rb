require "byebug"

class Board

    attr_reader :grid

    def initialize 
        @grid = Array.new(3) { Array.new(3, "_") }
    end 

    def [](pos)
        row, col = pos
        grid[row][col]
    end 

    def []=(pos, mark)
        row, col = pos
        grid[row][col] = mark
    end 

    def valid?(pos)
        !self[pos].nil? && pos.none?(&:negative?)
    end 

    def empty?(pos)
        self[pos] == "_"
    end 

    def place_mark(pos, mark)
        if self.valid?(pos) && self.empty?(pos)
            self[pos] = mark
        elsif !self.valid?(pos)
            raise "Not a valid position"
        elsif !self.empty?(pos)
            raise "That position is already taken"
        end 
    end

    def print
        grid.each { |row| p row.join(" ") }
    end 

    def win_row?(mark)
        grid.any? do |row|
            row.all? { |sector| sector == mark }
        end 
    end 

    def win_col?(mark)
        grid.transpose.any? do |column|
            column.all? { |sector| sector == mark }
        end 
    end 

    def win_diagonal?(mark)
        left_diagonal = (0...grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end 

        right_diagonal = (0...grid.length).all? do |i|
            row = i
            col = grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end 

        left_diagonal || right_diagonal
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end 

    def empty_positions?
        grid.any? do |row|
            row.any? do |col|
                col == "_"
            end 
        end 
    end 
end 