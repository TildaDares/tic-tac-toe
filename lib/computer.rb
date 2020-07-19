# frozen_string_literal :true

class Computer
  require_relative 'game_board'
  require_relative 'game_plays'
  require_relative 'player'
  require_relative 'check_for_two_equal_cells'
  include CheckForTwoEqualCells

  def initialize(name, tag, difficulty)
    @name = name
    @tag = tag
    @difficulty = difficulty
    @@player_details = GamePlays.plays
    @@player_board_play = GamePlays.game_tags_method
  end

  def move
    board = GameBoard.new(@@player_details)
    puts "#{@name}'s turn"
    if @difficulty == 'Beginner'
      move_beginner
    elsif @difficulty == 'Intermediate'
      move_intermediate
    else
      move_expert
    end
    GamePlays.game_tags_method = @@player_board_play
    board.build_board(@@player_board_play)
    break_when_winner = board.check_wins(@name)
    break_when_winner
  end

  private

  def move_beginner
    loop do
      random = rand(9)
      unless /\D/ =~ @@player_board_play[random]
        puts "#{@name} is thinking..."
        sleep(rand(3))
        @@player_board_play[random] = @tag
        break
      end
      next
    end
  end

  def move_intermediate
    if object_tag_is_first_priority(@@player_board_play, @tag).length.zero?
      if two_equal_cells(@@player_board_play).length.zero?
        move_beginner
      else
        puts "#{@name} is thinking..."
        sleep(rand(3))
        index = two_equal_cells(@@player_board_play).sample
        @@player_board_play[index] = @tag
      end
    else
      puts "#{@name} is thinking..."
      sleep(rand(3))
      index = object_tag_is_first_priority(@@player_board_play, @tag).sample
      @@player_board_play[index] = @tag
    end
 end

  def move_expert
    if object_tag_is_first_priority(@@player_board_play, @tag).empty?
      if two_equal_cells(@@player_board_play).empty?
        if @@player_board_play[4] == '5'
          @@player_board_play[4] = @tag
          return
        end
        move_beginner
      else
        puts "#{@name} is thinking..."
        sleep(rand(3))
        index = two_equal_cells(@@player_board_play).sample
        @@player_board_play[index] = @tag
      end
    else
      puts "#{@name} is thinking..."
      sleep(rand(3))
      index = object_tag_is_first_priority(@@player_board_play, @tag).sample
      @@player_board_play[index] = @tag
    end
  end
end
