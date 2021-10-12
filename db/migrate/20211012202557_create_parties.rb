class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.date :date
      t.time :time
      t.string :movie_title
      t.string :movie_runtime

      t.timestamps
    end
  end
end
