require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="", artist_name ="")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def self.new_from_filename(filename)
    text = filename.split("-")
    artist_name = text[0].strip
    name = text[1].delete_suffix(".mp3").strip

    song = Song.new(name, artist_name)
  end

  def self.create_from_filename(filename)
    text = filename.split("-")
    artist_name = text[0].strip
    name = text[1].delete_suffix(".mp3").strip

    song = Song.new(name, artist_name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    return self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

end

#binding.pry
