# frozen_string_literal :true

require './lib/game_board'
describe GameBoard do
  describe 'build_board' do
    subject { described_class.new({ 'name' => 'Love', 'name2' => 'Tilda' }) }
    context "when there's a win diagonally" do
      it 'returns true' do
        subject.build_board(%w[1 2 X 4 X 6 X 8 9])
        expect(subject.check_wins('Love')).to eql(true)
      end
    end

    context "when there's a win vertically" do
      it 'returns true' do
        subject.build_board(%w[O 2 3 O 5 6 O 8 9])
        expect(subject.check_wins('Love')).to eql(true)
      end
    end

    context "when there's a win horizontally" do
      it 'returns true' do
        subject.build_board(%w[O O O 4 5 6 7 8 9])
        expect(subject.check_wins('Love')).to eql(true)
      end
    end

    context "when there's a stalemate" do
      it 'returns true' do
        subject.build_board(%w[O X O X O X X O X])
        expect(subject.check_wins('Love')).to eql(true)
      end
    end

    context "when there's no win yet" do
      it 'returns false' do
        subject.build_board(%w[O 2 3 O 5 6 X 8 9])
        expect(subject.check_wins('Love')).to eql(false)
      end
    end
  end
end
