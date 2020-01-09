class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.text :description
      t.string :longitude
      t.string :latitude
      t.string :region
      t.integer :min_duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
