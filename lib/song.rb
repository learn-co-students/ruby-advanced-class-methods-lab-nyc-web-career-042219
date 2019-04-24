require 'pry'

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
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = self.new_by_name(name)
  	song.save
  	song
  end

  def self.find_by_name(name)
  	self.all.find { |song| name == song.name }
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(name_and_artist)
  	arr = name_and_artist.split(" - ")
  	artist = arr[0]
  	song = arr[1]
  	tr_song = song.chomp(".mp3")
  	new_song = self.new_by_name(tr_song)
  	new_song.artist_name = artist
  	new_song

  end

  def self.create_from_filename(filename)
  	arr = filename.split(" - ")
  	song = arr[1]
  	tr_song = song.chomp(".mp3")
  	new_song = self.create_by_name(tr_song)
  	new_song.artist_name = arr[0]
  	new_song
  end

  def self.destroy_all
  	self.all.clear
  end

end
