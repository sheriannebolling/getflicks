class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :genre, null: false
      t.string :title, null: false
      t.string :year, null: false
      t.string :director, null: false
      t.string :cast, null: false
      t.string :plot, null: false
      t.string :poster
      t.string :trailer

      t.timestamps
    end
  end
end
