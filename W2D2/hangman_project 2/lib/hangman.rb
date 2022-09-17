class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

    def self.random_word
        DICTIONARY.sample
    end 

    def initialize
        @secret_word = Hangman.random_word
        @guess_word = Array.new(@secret_word.length, "_")
        @attempted_chars = []
        @remaining_incorrect_guesses = 5
    end 

    def already_attempted?(char)
        @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
        matches = []
        @secret_word.each_char.with_index { |letter, idx| matches << idx if char == letter }
        matches
    end 

    def fill_indices(char, array)
        array.each { |idx| @guess_word[idx] = char }
    end 

    def try_guess(char)
        if already_attempted?(char)
            puts "that has already been attempted" 
            return false
        else 
            @attempted_chars << char
            matches = get_matching_indices(char)
            fill_indices(char, matches)
            @remaining_incorrect_guesses -= 1 if matches.empty?
            return true
        end 
    end 

    def ask_user_for_guess
        print "Enter a char: "
        response = gets.chomp
        try_guess(response)
    end 

    def win?
        if @guess_word.join("") == @secret_word
            puts 'WIN'
            return true
        end 
        
        false
    end 

    def lose?
        if @remaining_incorrect_guesses == 0
            puts "LOSE"
            return true
        end 

        false 
    end 

    def game_over?
        if self.win? || self.lose?
            puts @secret_word
            return true
        end

        false 
    end 
end
