

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
    return song


  end


  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song


  end

  def self.create_by_name(song_name)
    # song = self.new
    # song.name = song_name
    # song.save
    # song
    song = self.new_by_name(song_name)
    song.save
    song


  end

def self.find_by_name(name)

  @@all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  if  self.find_by_name(name) != nil
      self.find_by_name(name)
    else
   self.create_by_name(name)
end
end

def self.alphabetical
  self.all.sort_by { |song| song.name }
end

def self.new_from_filename(file_name)
file_name.slice!(".mp3")
file_name_arr = file_name.split(" - ")
song = self.new_by_name(file_name_arr[1])
song.artist_name = file_name_arr[0]
song

end

def self.create_from_filename(file_name)
new_song = self.new_from_filename(file_name)
new_song.save
new_song

end

def self.destroy_all
  @@all.clear
end


end
