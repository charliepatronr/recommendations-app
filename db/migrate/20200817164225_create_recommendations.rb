class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.integer :student_id
      t.integer :song_id
      t.timestamps
    end
  end
end
