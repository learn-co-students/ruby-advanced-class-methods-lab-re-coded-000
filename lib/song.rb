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
  first_song=self.new
    self.all << first_song
    return first_song
  end
  def self.new_by_name(name_of_song)
    second_song= self.new
    second_song.name= name_of_song
    second_song
  end
  def self.create_by_name(name_of_song)
   third_song =self.create
   third_song.name =name_of_song
   third_song
end
def self.find_by_name(name_of_song)
  self.all.detect{|person| person.name==name_of_song}
end
def self.find_or_create_by_name(name_of_song)
self.find_by_name(name_of_song)||self.create_by_name(name_of_song)
end
def self.alphabetical
  self.all.sort_by{|rez| rez.name}
end
def self.new_from_filename(name_of_song)
   array=name_of_song.split(" - ")
   song=self.new_by_name(array[1].gsub(".mp3",""))
   song.artist_name=array[0]
   song
 end
 def self.create_from_filename(name_of_song)
    song=self.new_from_filename(name_of_song)
    song.save
    song
  end
  def self.destroy_all
  self.all.clear
  end
end
