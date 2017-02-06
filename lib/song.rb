class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize
    @name=name
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song=Song.new
    song.save
   song
  end
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end
 def self.create_by_name(song_name)
   song=self.create
   song.name=song_name
   song
  end

   def self.find_by_name(song_name)
     self.all.detect {|i| i.name == song_name}
    end
   def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) || self.create_by_name(song_name)
   end

  def self.alphabetical
      self.all.sort_by{|song| song.name}

   end
  def self.create_from_filename(file_name)
    array=file_name.split(" - ")
    song=self.create_by_name(array[1].gsub(".mp3",""))
    song.artist_name=array[0]
    song

   end
  def self.new_from_filename(file_name)
    array=file_name.split(" - ")
    song=self.new_by_name(array[1].gsub(".mp3",""))
    song.artist_name=array[0]
    song
  end
 def self.destroy_all
  self.all.clear
 end
end
