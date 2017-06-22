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
song=Song.new
song.save
song
end
def self.new_by_name(name)
  song=Song.new
  song.name=name
  song
end
def self.create_by_name(name)
    song=Song.new_by_name(name)
    song.name
    song.save
    song
  end
  def self.find_by_name(name)
  self.all.find{|s| s.name==name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  def self.new_from_filename
    song=Song.new
    song=Song.new_from_filename
  end

  # Create a #new_by_filename class method that accepts 1 argument, a file name in this format: "Artist Name - Song Title.mp3"
  def self.new_from_filename(file_name)

    # Split the file name (a string) into an array by using the #split method and giving it " - " as an argument
    array=file_name.split(" - ")

    # Now we have an array that looks like this: ["Artist Name", "Song Title.mp3"]

    # We invoke our #new_by_name class method and pass in the second element in our array, "Song Title.mp3" —— but before passing it in, we remove the ".mp3" from the end of the string with the #gsub method
    song=self.new_by_name(array[1].gsub(".mp3",""))

    # Then, we set the artist_name attribute of the new song to the first element in the array, "Artist Name"
    song.artist_name=array[0]

    # And finally, we return the newly-created song object
    song
  end
def self.create_from_filename(file_name)
  song=Song.new_from_filename(file_name)
  song.save
  song
end
  def self.destroy_all
    @@all.clear
    @@all
  end
end
