def sign_in_and_play
  visit "/"
  fill_in :player_name_1, with: 'Bob'
  fill_in :player_name_2, with: 'Karen'
  click_button('Play')
end

def sign_in_and_attack
  visit "/"
  fill_in :player_name_1, with: 'Bob'
  fill_in :player_name_2, with: 'Karen'
  click_button('Play')
  click_link('Nipple Cripple')
end



def attack
click_link('Nipple Cripple')
click_link('Release the Nips')
end
