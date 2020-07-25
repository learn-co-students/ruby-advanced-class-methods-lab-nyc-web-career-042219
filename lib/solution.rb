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
    song = song
  end

  def self.create
    song = self.new
    song.save
    song
  end

def self.new_by_name(song_name)
  song = self.new
  binding.pry
  song.name = song_name
  song
end

def self.create_by_name(song_name)
  song = self.new # => song = Song.new  instance of Song. song.class = Song
  song.name = song_name # calls the attr_accessor in particular the setter method
  song.save
  song
end

def self.find_by_name(song_name)
@@all.each.find {|song| song.name == song_name}

end

def self.find_or_create_by_name(song_name)
self.create_by_name(song_name)
self.find_by_name(song_name)
end

def self.alphabetical
  @@all.sort_by {|song| song.name}
end

def self.new_from_filename(file_name)
  file_name.slice! (-4..-1)
  file = file_name.split(" - ")
  binding.pry
  song = self.new
  song.name = file[1]
  song.artist_name = file[0]
  song
end

def self.create_from_filename(file_name)
  file_name.slice! ".mp3"
  file = file_name.split(" - ")
  song = self.create
   song.name = file[1]
   song.artist_name = file[0]
   song

end

def self.destroy_all
  @@all.clear
end



end
