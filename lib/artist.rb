require 'pry'
class Artist
    attr_accessor :name
   

    def initialize(name)
        @name = name
        
    end

    def songs
      Song.all.find_all do |song|
        song.artist.name == self.name 

        end
    end

    def add_song(song)
         song.artist = self
    end

    def add_song_by_name(song_name)
        song_name = Song.new(song_name)
        song_name.artist = self
    end

    def self.song_count
       Song.all.select do |song| #this properly checks every song that has an assoc. w/ an artist. otherwise don't count the nils
        song.artist != nil #its possible that we can get nils handed to us when passed some of these args
       end.count
    end

    # def self.song_count
    #     Song.all.count <--- this also works for the above
    #  end

end
#if it tests for belong to, we are telling the child element what their parent is 
#has many - we are adding a child to the parent
