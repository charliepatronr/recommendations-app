

class Song < ActiveRecord::Base
    has_many :recommendations
    has_many :students, through: :recommendations
    
    def self.playlist
        Song.all.map do |song|
        puts "#{song.name} - #{song.artist}\n"
        end
    end

end