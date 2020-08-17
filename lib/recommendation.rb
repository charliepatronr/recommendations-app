

class Recommendation < ActiveRecord::Base
    belongs_to :student
    belongs_to :song
    
end