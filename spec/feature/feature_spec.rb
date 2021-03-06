require_relative '../../app.rb'

feature Battle do
  let(:name_1) { 'Bob' }
  let(:name_2) { 'Karen' }
  let(:normal_hit_points) { 50 }
  let(:reduced_hit_points) { 40 }

  feature 'To set-up the game' do
    scenario 'Should allow players to enter their names' do
      sign_in_and_play
      expect(page).to have_content "#{name_1} V #{name_2}"
    end
  end

  feature 'When the game is ready to go' do
    scenario "Should display Player 2's hitpoints" do
      sign_in_and_play
      expect(page).to have_content "#{name_2} hit points: #{normal_hit_points}"
    end
  end

  feature 'when attacking player' do
    scenario 'should get confirmation' do
      sign_in_and_attack
      expect(page).to have_content('You squeezed them raw!')
    end

    scenario 'should reduce health' do
      sign_in_and_attack
      click_link('Release the Nips')
      expect(page).to have_content "#{name_2} hit points: #{reduced_hit_points}"
    end

    scenario 'swap players and attack player 1' do
      sign_in_and_attack
      click_link('Release the Nips')
      attack
      expect(page).to have_content "#{name_1} hit points: #{reduced_hit_points}"
    end

  end
end
