

class Student < ActiveRecord::Base
    has_many :recommendations
    has_many :songs, through: :recommendations

end