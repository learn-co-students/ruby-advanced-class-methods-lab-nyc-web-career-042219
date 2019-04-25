require 'pry'

class Song
  attr_accessor :name, :artist_name

  # def initialize(name)
  #   @name = name
  # end
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(string)
    song = Song.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = Song.new
    song.name = string
    @@all << song
    song
  end

  def self.find_by_name(string)
    @@all.find do |i|
      i.name == string
    end
  end

  def self.find_or_create_by_name(string)
      if self.find_by_name(string) == nil
        self.create_by_name(string)
      else
        self.find_by_name(string)
      end
    end

    def self.alphabetical
      self.all.sort_by do |i|
        i.name
      end
    end

    def self.new_from_filename(string)
      song = Song.new
      array =  string.chomp(".mp3").split(" - ")
      song.name = array[1]
      song.artist_name = array[0]
      return song
    end

    def self.create_from_filename(string)
      song = Song.new
      array = string.chomp(".mp3").split(" - ")
      song.name = array[1]
      song.artist_name = array[0]
      @@all << song
    end

    def self.destroy_all
      @@all.clear 
    end

  end
