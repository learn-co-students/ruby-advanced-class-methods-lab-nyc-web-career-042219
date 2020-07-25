class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name).class == Song
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.new_from_filename(file)
    file.chomp!(".mp3")
    formatted_name = file.split(" - ")
    song = Song.new
    song.name = formatted_name[1]
    song.artist_name = formatted_name[0]
    song
  end

  def self.create_from_filename(file)
    file.chomp!(".mp3")
    formatted_name = file.split(" - ")
    song = Song.new
    song.name = formatted_name[1]
    song.artist_name = formatted_name[0]
    self.all << song 
    song
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
