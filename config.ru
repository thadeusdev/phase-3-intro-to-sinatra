require 'sinatra'

class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  get '/dice' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

   # :num1 and :num2 are named parameters
   get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

  #we could set up a route that returns a specific Game from the games table, formatted as JSON - this won't work yet, since we don't have a Game class set up
  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end

end

run App
