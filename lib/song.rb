require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def self.new_artist(artistname)
  #     binding.pry
  #     self.artist_name= ""
  #
  #     self.artist_name=artistname
  #   #  binding.pry
  #   end

  def save
    self.class.all << self
  end
  def self.create
    newsong=self.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong=create
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong=self.new_by_name(name)
    newsong.save
    newsong
  end

  def self.find_by_name(name)
#    flag=@@all.include?(name)

    songmatch=self.all.select do |song| song.name == name end
#      binding.pry
    songmatch.first
  end
  def self.find_or_create_by_name(name)
      songreturn=self.find_by_name(name)
      # binding.pry
      if songreturn == nil
        self.create_by_name(name)
      else
          songreturn
      end
  end

  def self.alphabetical
    # binding.pry
    length=@@all.length
    @@all.uniq.sort_by do |song|
      song.name
    end

  end

  def self.new_from_filename (filename)
    artistsong=filename.split('.').first

    songname=artistsong.split(' - ').last

    newsong=self.new_by_name(songname)
    newsong.artist_name= artistsong.split(' - ').first
    newsong

  end
  def self.create_from_filename (filename)
    artistsong=filename.split('.').first

    songname=artistsong.split(' - ').last

    createsong=self.create_by_name(songname)
    createsong.artist_name=artistsong.split(' - ').first
    createsong.save
    createsong

  end

  def self.destroy_all
    @@all=[]
  end




end
