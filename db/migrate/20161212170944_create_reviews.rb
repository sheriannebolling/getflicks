class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :movie
      t.string :comment
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
