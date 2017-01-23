class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initializes(name, artist_name)
    @name=name
    @artist_name=artist_name
    @@all << self
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
def self.create(name)
  @@all.deyecat {|s| s.name == name}
end
end
