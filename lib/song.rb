  require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
  #  @@all << self
  song =self.new
  #binding.pry
  self.all << song
  song
  end
def self.new_by_name(name)
  @name = name
  song = self.create
  #binding.pry
  #self.all << song
  song.name = @name
  song
end
def self.create_by_name(name)
  @name = name
  song = self.create
  song.name = @name
  #self.all << song
  song
end
def self.find_by_name(search_name)
@@all.each do |song|
  if song.name == search_name
    return song
  end
end
end
def self.find_or_create_by_name(find_name)
  song = self.find_by_name(find_name)
   self.create_by_name(find_name)
  #song.all << song
  #binding.pry
end
def self.alphabetical

  songs = @@all.sort_by {|song| song.name}
end
def self.new_from_filename(name_song)
  songs = self.new
  artist_and_name = name_song.split("-")
  song_name = artist_and_name[1].split(".")
  #binding.pry
songs.name = song_name[0].strip
songs.artist_name=artist_and_name[0].strip
songs
end
def self.create_from_filename(filename)
  #song = filename.split("-")
  #artist_name = song[0]
  song=self.new_from_filename(filename)
   song.save
   song
end
def self.destroy_all
     self.all.clear
   end
end
