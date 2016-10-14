class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song=self.new
    self.all.push(song)
    return song
  end
  def self.new_by_name(name_)
    song=self.new
    song.name=name_
    return song
  end
  def self.create_by_name(name_)
    song = self.create
    song.name = name_
    return song
  end
  def self.find_by_name(name_)
    self.all.detect{|e| e.name == name_}
end
    def self.find_or_create_by_name(name_)
      self.find_by_name(name_) || self.create_by_name(name_)

  end
  def self.alphabetical
  self.all.sort_by { |e| e.name }
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
def self.new_from_filename(filename)
  song=self.new
  arr=filename.split(" - ")
  song.artist_name=arr[0]
  arr2=arr[1].split(".")
  song.name=arr2[0]
  return song
end
def self.create_from_filename(filename)
  song=self.create
  arr=filename.split(" - ")
  song.artist_name=arr[0]
  arr2=arr[1].split(".")
  song.name=arr2[0]
  return song
end
def self.destroy_all
  self.all.clear

end
end
song=Song.new_from_filename("Thundercat - For Love I Come.mp3")
puts song.name
