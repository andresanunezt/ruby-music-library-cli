class Artist
    attr_accessor :name, :song
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
    Artist.new(name)
    end
    
    def songs
    Song.all.each do |song|
    song.artist == self.name
    end
    end
    
    def add_song(song)
    if !song.artist 
        song.artist = self
    end
    end
    
    
    def genres
        genre_array = []
        songs.each do |song|
             if genre_array.include?(song.genre)
                nil
             else
               genre_array << song.genre
             end
        end
        genre_array
    end
    
    end