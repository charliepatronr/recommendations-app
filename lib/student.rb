

class Student < ActiveRecord::Base
    has_many :recommendations
    has_many :songs, through: :recommendations

    def self.login(name)
        student = self.find_or_create_by(name: name)
        p "Welcome #{student.name}!"
    end

    def recommend_song(name, genre, year, artist)
        song = Song.create(name: name, genre: genre, year: year, artist: artist)
        self.songs << song
    end

    def list_recommendations
        self.recommendations
    end

    def edit_recommendation(name, artist)
        song = Song.find_by(name: name, artist: artist)
        song_id = song.id
        #self.list_recommendations.find_by(song_id)
        #
    end

    def delete_recommendation

    end

end