class Player
    require_relative 'game_plays'
    require_relative 'game_board'

  def initialize(name, tag)
    @name = name
    @tag = tag
    game_play = GamePlays.new()
    @@player_details = GamePlays.plays
    @@player_board_play = GamePlays.game_tags_method
  end

  def self.return_array
    @@player_board_play
  end

  def move
    board = GameBoard.new(@@player_details)
    correct_coord = false
    while !correct_coord 
      puts "#{@name}'s turn"
      puts "Enter where you'd like to play (e.g. 1, 2)"
      coordinates = gets.chomp
      until /^[0-9]$/ =~ coordinates
        puts "Enter a valid coordinate (e.g. 3, 7)"
        coordinates = gets.chomp
        next
      end
      unless @@player_board_play.include? (coordinates)
        puts "This coordinate has already been entered"
        puts ""
        @correct_coord = false
        next
      end
      correct_coord = true
      array_coordinates(coordinates)
      GamePlays.game_tags_method = @@player_board_play
      board.build_board(@@player_board_play)
      break_when_winner = board.check_wins(@name)
    end
    return break_when_winner
  end

  private
  def array_coordinates(coordinates)
    case coordinates
      when '1'
        @@player_board_play[0] = @tag
      when '2'
        @@player_board_play[1] = @tag
      when '3'
        @@player_board_play[2] = @tag
     when '4'
       @@player_board_play[3] = @tag
     when '5'
       @@player_board_play[4] = @tag
     when '6'
       @@player_board_play[5] = @tag
     when '7'
       @@player_board_play[6] = @tag
     when '8'
      @@player_board_play[7] = @tag
     when '9'
      @@player_board_play[8] = @tag
    end
  end
end