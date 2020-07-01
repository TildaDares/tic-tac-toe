require './lib/check_for_two_equal_cells'
describe CheckForTwoEqualCells do
  let(:dummy_class) { Class.new { extend CheckForTwoEqualCells } }
  describe '#two_equal_cells' do
    it "returns the first random possible position the computer could play to block it's opponent" do
      expect(dummy_class.two_equal_cells(['O', '2', '3', '4', '5', '6', 'O', '8', '9'])).to eql([3])
    end

    it "returns the first random possible position the computer could play to block it's opponent.\
    The computer doesn't try to win just defend" do
      expect(dummy_class.two_equal_cells(['O', '2', 'X', '4', '5', 'X', 'O', '8', '9'])).to eql([8])
    end

    it "checks all the possible ways the computer could win and returns all the possible positions.\
    The computer trys to win before defending. The computer's tag here is X" do
      expect(dummy_class.object_tag_is_first_priority(['O', '2', 'X', '4', '5', 'X', 'O', '8', '9'], 'X')).to eql([8])
    end
  end
end
