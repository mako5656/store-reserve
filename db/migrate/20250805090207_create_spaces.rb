class CreateSpaces < ActiveRecord::Migration[8.0]
  def change
    create_table :spaces do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :address
      t.integer :price_per_hour
      t.integer :capacity
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
