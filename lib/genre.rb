class Genre

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
        # has many songs
        Song.all.select {|s| s.genre == self}
    end

    def artists
        # has many artists, through songs
        songs.map(&:artist)
    end

end