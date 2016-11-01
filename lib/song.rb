class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
# ----------------------------------------------------
  def save
    self.class.all << self
  end
  # ----------------------------------------------------
  def self.create
    song = self.new
    @@all << song
    song
  end
  # ----------------------------------------------------
  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end
  # ----------------------------------------------------
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end
  # ----------------------------------------------------
    def self.find_by_name(songname)
      self.all.detect do |song|
        song.name == songname
      end
    end
 # ----------------------------------------------------
    def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
    end
# ----------------------------------------------------
    def self.new_from_filename(filename)
        spltarr= filename.split("-")
        spltarr2 = spltarr[1].split("mp3")
        spltarr3 = spltarr2[0].strip.split(".")
        song = self.new
        song.artist_name= spltarr[0].strip
        song.name = spltarr3[0]
        song
    end
# ----------------------------------------------------
    def self.create_from_filename(filename)
      spltarr= filename.split("-")
      spltarr2 = spltarr[1].split("mp3")
      spltarr3 = spltarr2[0].strip.split(".")
      song = self.new
      song.artist_name= spltarr[0].strip
      song.name = spltarr3[0]
      self.all << song
    end
# ----------------------------------------------------
    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end
# ----------------------------------------------------
    def self.destroy_all
      self.all.clear
    end
end
