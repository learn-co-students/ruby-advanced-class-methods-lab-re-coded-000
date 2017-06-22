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
    song=self.new
     @@all << song
    return song
    end
    def self.new_by_name(name)
      new_song = self.new
    new_song.name = name
    new_song
    end
    def self.create_by_name(name2)
      song = self.create
      song.name = name2
      return song
    end
    def self.find_by_name(name3)
      self.all.detect{|song| song.name == name3}
  end
  def self.find_or_create_by_name(name4)
     self.find_by_name(name4) || self.create_by_name(name4)
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(filename)
    array1 = filename.split(" - ")
        artist_name = array1[0]
        array2 = array1[1].split(".mp3")
        name = array2[0]
        song = self.new
        song.artist_name = artist_name
        song.name = name
      song
    end
    def self.create_from_filename(filename)
      song=self.create
      array1=filename.split(" - ")
      artist_name = array1[0]
      array2 = array1[1].split(".mp3")
      name = array2[0]
      song.artist_name = artist_name
      song.name = name
      song
  end
  def self.destroy_all
    self.all.clear
  end
end
