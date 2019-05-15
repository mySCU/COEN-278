require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/song.db")

#define the model
class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :released, Date
end

DataMapper.finalize

get '/songs' do
  @songs = Song.all
  erb :songs
end

get '/songs/:id' do
  #use id to query table
  erb :show_song
end
