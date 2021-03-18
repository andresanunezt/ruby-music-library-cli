
class Genre
    attr_accessor :name
    extend Concerns::Findable
    @@all = []
    def initialize(name)
    @name = name
    save
    end
    
    def self.all
        @@all
    end
    
    def self.destroy_all
    @@all.clear
    end
    
    def save
        @@all << self
    end
    
    def self.create(name)
    Genre.new(name)
    end


    def songs
        Song.all.each do |song|
            song.genre == self.name
        end
    end

    def artists
        artist_array = []
    songs.each do |song|
         if artist_array.include?(song.artist)
            nil
         else
           artist_array << song.artist
         end
    end
    artist_array
    end
    
    end