describe Game do

  let(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  describe '#initialize' do
    it 'should assign the variable player_1' do
      expect(game.player_1).to eq(player_1)
    end

    it 'should assign current player' do
      expect(game.current_player).to eq(player_2)
    end
  end

  describe '#attack' do
    it 'should call decrease health method on argument' do
      expect(player_2).to receive(:decrease_health)
      game.attack(player_2)
    end
  end

  describe '#switch_player' do
    it 'should change current player to the opposite player' do
      game.switch_player
      expect(game.current_player).to eq(player_1)
    end
  end

end
