class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create(title = nil)
    song = self.new(title)
    song.save
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.create_by_name(name) unless self.find_by_name(name) #* These two lines also work.
    # self.find_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    array = file.split("- ") #@  =>["Artist_Name ", "Song_Title.mp3"]
    artist = array[0].slice(0, array[0].length - 1)
    title = array[1].slice(0, array[1].index("."))
    self.new(title, artist)
  end

  def self.create_from_filename(file)
    array = file.split("- ") #@  =>["Artist_Name ", "Song_Title.mp3"]
    artist = array[0].slice(0, array[0].length - 1)
    title = array[1].slice(0, array[1].index("."))
    song = self.new(title, artist)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def initialize(name, artist = "somthing")
    @name = name
    @artist_name = artist
  end

  def save
    self.class.all << self
  end

end

# a = Song.new_from_filename("Thundercat - For Love I Come.mp3")
# puts a.name