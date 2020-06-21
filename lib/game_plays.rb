class GamePlays
    attr_accessor :game_tags
    require_relative 'player'
    @@player_game_plays = {}
    @@game_tags = []

    def self.plays
      @@player_game_plays
    end

    def self.game_tags_method
      @@game_tags
    end

    def self.game_tags_method=(game_tags)
      @@game_tags = game_tags
    end

    def game_preambles
      @@game_tags = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
      game_options = ''
      @options = ['Human vs Computer', 'Human vs Human', 'Computer vs Computer']
      @difficulty_level = ['Beginner', 'Intermediate', 'Expert']
      puts "Let's play tic-tac-toe"

      ######################### Game Modes ############################
      loop do
        puts "Pick a game (select 1, 2 or 3)"
        puts <<-OPTIONS
        1. Human vs Computer
        2. Human vs Human
        3. Computer vs Computer
        OPTIONS
        @game_options = gets.chomp
  
        if /^[123]$/ =~ @game_options
          @@player_game_plays['options'] = @options[@game_options.to_i - 1]
          break
        end
      end
  
      ######################### Player Names ############################3
      loop do
        if @game_options == '1'
          puts "Enter your name"
          player_name = gets.chomp
          if player_name.length != 0
            @@player_game_plays['name'] = player_name
            @@player_game_plays['name2'] = 'computer'
            break
          end
        elsif @game_options == '2'
          puts "Enter your name"
          player_name = gets.chomp
          while player_name.length == 0
            puts "Enter a valid name"
            player_name = gets.chomp
          end

          puts "Enter player 2's name"
          player_name2 = gets.chomp
          while player_name2.length == 0
            puts "Enter a valid name"
            player_name2 = gets.chomp
          end

          if player_name.length != 0 && player_name2.length != 0
            @@player_game_plays['name'] = player_name
            @@player_game_plays['name2'] = player_name2
            break
          end
        else 
          @@player_game_plays['name'] = 'computer1'
          @@player_game_plays['name2'] = 'computer2'
          @@player_game_plays['tag'] = 'X'
          @@player_game_plays['tag1'] = 'O'
          break
        end
       end
  
       ######################### Difficulty Level ############################3
      loop do
        break if @game_options == '2'
        correct_option = true
        if @game_options == '3' 
          while correct_option
            puts "How smart is computer 1?"
            puts <<-OPTIONS
            1. Dumb
            2. Smart
            3. Genius
            OPTIONS
            comp_diff = gets.chomp
            unless /^[123]$/ =~ comp_diff
              next
            end
            @@player_game_plays['difficulty'] = @difficulty_level[comp_diff.to_i - 1]
            break
          end

          while correct_option
            puts "How smart is computer 2?"
            puts <<-OPTIONS
            1. Dumb
            2. Smart
            3. Genius
            OPTIONS
            comp_diff = gets.chomp
            unless /^[123]$/ =~ comp_diff
              next
            end
            @@player_game_plays['difficulty2'] = @difficulty_level[comp_diff.to_i - 1]
            break
          end
          break
        end

          puts "Pick a difficulty level"
          puts <<-OPTIONS
          1. Beginner
          2. Intermediate
          3. Expert
          OPTIONS
          difficulty = gets.chomp
  
          if /^[123]$/ =~ difficulty
              @@player_game_plays['difficulty'] = @difficulty_level[difficulty.to_i - 1]
              break
          end
      end
  
      ######################### Game Markers ############################3
      loop do
        break if @game_options == '3'
        puts "Player 1 pick a tag (X or O)"
        tag = gets.chomp
        if /^[xo]$/i.match(tag) != nil
          @@player_game_plays['tag'] = tag.upcase
          /^x$/i =~ tag ? @@player_game_plays['tag1'] = 'O' : @@player_game_plays['tag1'] = 'X'
          break
       end
     end
   end
 end