require 'Pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    # @song.name = @name
    # @song.artist_name = @artist_name
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    Song.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort_by { |song_name| song_name.name}
  end

  def self.new_from_filename(mp3)
    song_and_artist = mp3.split(".")[0]
    song_name = song_and_artist.split("-")[1].strip
    artist = song_and_artist.split("-")[0].strip

    song = Song.new
    song.name = song_name
    song.artist_name = artist

    song
  end

  def self.create_from_filename(mp3)
    song_and_artist = mp3.split(".")[0]
    song_name = song_and_artist.split("-")[1].strip
    artist = song_and_artist.split("-")[0].strip

    song = Song.create
    song.name = song_name
    song.artist_name = artist

    song
  end

  def self.destroy_all
    self.all.clear
  end

end
