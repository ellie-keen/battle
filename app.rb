require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Our secret session"



  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1 = Player.new(params[:player_name_1])
    @player_2 = Player.new(params[:player_name_2])
    $game = Game.new(@player_1, @player_2)
    
    redirect '/play'
  end

  get '/play' do
    @player_name_1 = $game.player_1.name
    @player_name_2 = $game.player_2.name
    @player_hit_points_1 = $game.player_1.health
    @player_hit_points_2 = $game.player_2.health

    erb :play
  end

  get '/cripplethem' do
    $game.attack($game.current_player)
    $game.switch_player

    erb :cripplethem
  end
end
