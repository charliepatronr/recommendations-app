

class Song < ActiveRecord::Base
    has_many :recommendations
    has_many :students, through: :recommendations
    
    def self.playlist
        Song.all.map do |song|
        puts "#{song.name} - #{song.artist}\n"
        end
    end


    def self.song_viewer(song_name)
        song = Song.find_by(name: song_name)
        puts "#{song.name} by #{song.artist} was recommended by #{song.students.first.name}"
    end

end