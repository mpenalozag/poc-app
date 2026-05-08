require 'sinatra/base'
require 'sinatra/activerecord'
require 'active_record'

class Item < ActiveRecord::Base
end

class App < Sinatra::Base
  set :database, { adapter: 'postgresql', url: ENV.fetch('DATABASE_URL') }

  get '/healthz' do
    'ok'
  end

  get '/count' do
    content_type :json
    { count: Item.count }.to_json
  end

  get '/items' do
    content_type :json
    Item.all.to_json
  end
end
