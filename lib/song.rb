class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save #save each instance into the class array
    self.class.all << self
  end
  def self.create #create instance and add it to @@all
    song = self.new
    @@all << song
    song
  end
  def self.create_by_name(song_name) #create instance has a specific name and add it to @@all
    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end
  def self.new_by_name(song_name)  #create instance has a specific name
    new_song = self.new
    new_song.name = song_name
    new_song
  end
    def self.find_by_name(songname)   #class finder
      self.all.detect do |song|  #detect the song of the songs that are saved in @@all
        song.name == songname  #be aware about the equal sign
      end
    end

    def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
    end

    def self.new_from_filename(filename)  #using csv to create an instance
        spltarr= filename.split("-")
        spltarr2 = spltarr[1].split("mp3")
        spltarr3 = spltarr2[0].strip.split(".")
        song = self.new
        song.artist_name= spltarr[0].strip
        song.name = spltarr3[0]
        song
    end

    def self.create_from_filename(filename)  #using csv to create an instance and save
      spltarr= filename.split("-")
      spltarr2 = spltarr[1].split("mp3")
      spltarr3 = spltarr2[0].strip.split(".")
      song = self.new
      song.artist_name= spltarr[0].strip
      song.name = spltarr3[0]
      self.all << song
    end

    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end

    def self.destroy_all
      self.all.clear
    end
end
