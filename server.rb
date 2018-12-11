# frozen_string_literal: true

require 'sinatra'
require 'sinatra/partial'
require './lib/field'
require './lib/ship'

get '/' do
  erb :start_form, layout: :layout
end

post '/game/' do
  size = params['size'].to_i
  quantity = params['quantity'].to_i
  ours_field = Field.new(size)
  ours_field.fill_randomly(quantity)
  theirs_field = Field.new(size, covered: true)
  theirs_field.fill_randomly(quantity)

  erb :game,
      locals: { 'ours_field' => ours_field, 'theirs_field' => theirs_field },
      layout: :layout
end

get '/shot/:x_position/:y_position' do
  params.to_s
end
