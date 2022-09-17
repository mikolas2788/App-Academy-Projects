require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(board_length)
        @player = Player.new
        @board = Board.new(board_length)
        @remaining_misses = (board_length * board_length) / 2
    end 

    def start_game
        @board.place_random_ships
        puts "There are #{@board.num_ships} on the board"
        puts @board.print
    end 

    def lose?
        if @remaining_misses <= 0 
            puts 'you lose'
            return true
        else
            false
        end 
    end 

    def win?
        if @board.num_ships == 0
            puts 'you win'
            return true
        else 
            false
        end 
    end 

    def game_over?
        return true if self.lose? || self.win?
        false 
    end 

    def turn
        move = @player.get_move
        @remaining_misses -=1 if !board.attack(move)
        puts @board.print
        puts @remaining_misses
    end 
end
