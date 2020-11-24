class Artist

    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        # returns all songs associated with this Artist
        Song.all.select {|s| s.artist == self}
    end

    def new_song(name, genre)
        # given a name and genre, creates a new song associated with that artist
        Song.new(name, self, genre)
    end

    def genres
        # has many genres, through songs
        songs.map(&:genre)
    end

end
