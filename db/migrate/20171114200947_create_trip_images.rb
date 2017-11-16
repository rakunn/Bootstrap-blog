class CreateTripImages < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_images do |t|
      t.string :caption
      t.integer :trip_id

      t.timestamps
    end
  end
end
