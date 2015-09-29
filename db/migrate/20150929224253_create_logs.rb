class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :latitude_hemisphere
      t.integer :latitude_degrees
      t.integer :latitude_minutes
      t.integer :latitude_seconds
      t.string :longitude_hemisphere
      t.integer :longitude_degrees
      t.integer :longitude_minutes
      t.integer :longitude_seconds
      t.decimal :nautical_miles
      t.string :incidents
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
