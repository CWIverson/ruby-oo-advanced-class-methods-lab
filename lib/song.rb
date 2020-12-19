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
    song= self.new
    @@all << song
    song
  end
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  def self.create_by_name(name)
    new_song = self.new
    new_song.name= name
    @@all << new_song
    new_song
  end
  def self.find_by_name(name)
    @@all.find{|song|song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  def self.new_from_filename(filename)
    array = filename.split(/\s\-\s|\./)
    array.pop 
    new_song = self.new
    new_song.name = array[1]
    new_song.artist_name = array[0]
    new_song

  end
  def self.create_from_filename(filename)
    self.all<<self.new_from_filename(filename)
  end
  def self.destroy_all
    self.all.clear
  end
end
