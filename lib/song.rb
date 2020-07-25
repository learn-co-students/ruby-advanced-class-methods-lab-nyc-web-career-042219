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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    arr = file_name.split(" - ")
    artist = arr[0]
    index = arr[1].index(".mp3")
    title = arr[1].slice(0, index)
    song = self.new(title, artist)
  end

def self.create_from_filename(file_name)
  arr = file_name.split(" - ")
  artist = arr[0]
  index = arr[1].index(".mp3")
  title = arr[1].slice(0, index)
  song = self.new(title, artist)
  song.save
  song
end

def self.destroy_all
  self.all.clear
end

  def initialize(name = nil, title = nil)
    @artist_name = title
    @name = name
  end

end
