describe Game do

  let(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  describe '#attack' do
    it "should call decrease health method on argument" do
      expect(player_2).to receive(:decrease_health)
      game.attack(player_2)
    end
  end

end
