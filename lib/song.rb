require 'pry'
class Song

attr_accessor :name
attr_reader :genre, :artist
extend Concerns::Findable
@@all = []

def initialize(name, artist = nil, genre = nil)
@name = name
self.artist=(artist) if artist != nil
self.genre=(genre) if genre != nil
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
song = Song.new(name)
song.save
song

end

def artist=(artist)
   @artist = artist
   artist.add_song(self)

end

def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

def self.find_by_name(name)
self.all.find do |song|
    song.name == name
end
end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
    song_parts = filename.split(" - ")
    song_name = song_parts[1]
    artist_name = song_parts[0]
    genre_name = song_parts[2].split(".mp3").join

    artist =  Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name,artist,genre)
# binding.pry
end

def self.create_from_filename(filename)
    self.new_from_filename(filename).save
end
end