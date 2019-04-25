require "pry"

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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    self.all.find{|x| x.name == name}
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    self.all.find{|x| x.name == name}
  end

  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    order = self.all.map do |obj|
      obj.name
    end.sort
    answer = []
    order.select do |song|
      answer << self.find_by_name(song)
    end
    return answer
  end

  def self.new_from_filename(file)
    one = file.split("-")
    artist = one[0].strip
    two = one[1].split(".")
    title = two[0].strip
    self.create_by_name(title)
    self.find_by_name(title).artist_name = artist
    self.find_by_name(title)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.all=(thing)
    @@all = thing
  end

  def self.destroy_all
    self.all = []
  end

end
