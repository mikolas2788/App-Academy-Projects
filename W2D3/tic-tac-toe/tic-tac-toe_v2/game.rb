require './board.rb'
require './human_player.rb'

class Game 
    
    attr_reader :board, :player1, :player2, :current_player

    def initialize(mark1, mark2)
        @board = Board.new
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @current_player = @player1
    end 

    def switch_turn
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end 

    def play
        while board.empty_positions?
            board.print
            pos = current_player.get_position
            board.place_mark(pos, current_player.mark)
            if board.win?(current_player.mark)
                puts "#{current_player.mark} won!"
                return
            else 
                self.switch_turn
            end 
        end 

        puts "Game Over"
        puts "Draw"
    end 
end 