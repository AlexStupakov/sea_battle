# frozen_string_literal: true

require 'sinatra'
require 'sinatra/partial'
require './lib/field'
require './lib/ship'

get '/' do
  <<-HTML
   <h1>Welcome to Sea Battle!</h1>
   <br>
   <br>/api/v1/account
   <br>/api/v1/my_trades?symbol=LTCBTC
   <br>/api/v1/all_my_trades
  HTML
end

get '/start' do
  erb :start_form
end

post '/game/' do
  p params
  size = params['size'].to_i
  quantity = params['quantity'].to_i
  ours_field = Field.new(size)
  ours_field.fill_randomly(quantity)
  theirs_field = Field.new(size, covered: true)
  theirs_field.fill_randomly(quantity)
  # "Your ships:"
  # ours_field.print_field

  erb :game, locals: { 'ours_field' => ours_field, 'theirs_field' => theirs_field }
end
