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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name (name)
    new_song = Song.new
    new_song.name = name

    new_song
  end

  def self.create_by_name (name)

    new_song = Song.new

    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name (song_name)
    @@all.find do |song|
        song.name == song_name

    end
  end

  def self.find_or_create_by_name (song_name)
    if self.find_by_name (song_name)
      self.find_by_name (song_name)
    else
      self.create_by_name (song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename (file_name)
    song_and_artist = file_name.split(".")[0]
    song_name = song_and_artist.split("-")[1].strip
    artist = song_and_artist.split("-")[0].strip

    song = self.new_by_name(song_name)

    song.artist_name = artist
    song
  end

  def self.create_from_filename (file_name)
    song_and_artist = file_name.split(".")[0]
    song_name = song_and_artist.split("-")[1].strip
    artist = song_and_artist.split("-")[0].strip

    song = self.create_by_name(song_name)

    song.artist_name = artist

    song
  end


  def self.destroy_all
    @@all = []
  end
end
