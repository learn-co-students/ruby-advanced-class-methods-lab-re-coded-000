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
    song = self.new
    @@all << song
    song
  end
  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end
    def self.find_by_name(songname)
      self.all.detect do |song|
        song.name == songname
      end
    end
    def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
    end
    def self.alphabetical
    self.all.sort_by{|song| song.name}
    end
    def self.new_from_filename(filename)
        data = filename.split(" - ")
        artist_name = data[0]
        data2 = data[1].split(".")
        name = data2[0]
        song = self.new
        song.artist_name = artist_name
        song.name = name
      song
    end
    def self.create_from_filename(filename)
      data = filename.split(" - ")
      artist_name = data[0]
      data2 = data[1].split(".")
      name = data2[0]
      song = self.new
      song.artist_name = artist_name
      song.name = name
      self.all << song
    end
    def self.destroy_all
      self.all.clear
    end
end
