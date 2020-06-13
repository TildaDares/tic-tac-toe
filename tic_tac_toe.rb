class TicTacToe
  require_relative 'game_board'
  require_relative 'game_plays'
  require_relative 'player'
  require_relative 'computer'

  game = GamePlays.new()
    game.game_preambles()
    @player_details = GamePlays.plays
    @player_board_play = GamePlays.game_tags_method
    board = GameBoard.new(@player_details)
    board.build_board(@player_board_play)

    case @player_details['options']
    when 'Computer vs Computer'
      computer1 = Computer.new(@player_details['name'], @player_details['tag'], @player_details['difficulty'])
      computer2 = Computer.new(@player_details['name2'], @player_details['tag1'], @player_details['difficulty2'])
    when 'Human vs Human'
      player1 = Player.new(@player_details['name'], @player_details['tag'])
      player2 = Player.new(@player_details['name2'], @player_details['tag1'])
    else
      player1 = Player.new(@player_details['name'], @player_details['tag'])
      computer1 = Computer.new(@player_details['name2'], @player_details['tag1'], @player_details['difficulty'])
    end

    loop do
      if @player_details['options'] == 'Human vs Human'
        break_when_winner = player1.move
        break if break_when_winner
        break_when_winner = player2.move
        break if break_when_winner
      elsif @player_details['options'] == 'Human vs Computer'
        break_when_winner = player1.move
        break if break_when_winner
        break_when_winner = computer1.move
        break if break_when_winner
      else
        break_when_winner = computer1.move
        break if break_when_winner
        break_when_winner = computer2.move
        break if break_when_winner
      end
end
end