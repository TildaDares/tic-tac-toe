require './lib/game_board'
describe GameBoard do
  describe "build_board" do
    it "returns true when there's a win diagonally" do
      board = GameBoard.new(player_details= {'name' => 'Love', 'name2' => 'Tilda'})
      board.build_board(['1','2', 'X', '4', 'X', '6', 'X', '8', '9'])
      expect(board.check_wins('Love')).to eql(true)
    end

    it "returns true when there's a win vertically" do
      board = GameBoard.new(player_details= {'name' => 'Love', 'name2' => 'Tilda'})
      board.build_board(['O','2', '3', 'O', '5', '6', 'O', '8', '9'])
      expect(board.check_wins('Love')).to eql(true)
    end

    it "returns true when there's a win horizontally" do
      board = GameBoard.new(player_details= {'name' => 'Love', 'name2' => 'Tilda'})
      board.build_board(['O','O', 'O', '4', '5', '6', '7', '8', '9'])
      expect(board.check_wins('Love')).to eql(true)
    end

    it "returns true when there's a stalemate" do
      board = GameBoard.new(player_details= {'name' => 'Love', 'name2' => 'Tilda'})
      board.build_board(['O','X', 'O', 'X', 'O', 'X', 'X', 'O', 'X'])
      expect(board.check_wins('Love')).to eql(true)
    end

    it "returns false when there's no win yet" do
      board = GameBoard.new(player_details= {'name' => 'Love', 'name2' => 'Tilda'})
      board.build_board(['O','2', '3', 'O', '5', '6', 'X', '8', '9'])
      expect(board.check_wins('Love')).to eql(false)
    end
  end
end