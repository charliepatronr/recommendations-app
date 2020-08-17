

class Song < ActiveRecord::Base
    has_many :recommendations
    has_many :students, through: :recommendations
    
end