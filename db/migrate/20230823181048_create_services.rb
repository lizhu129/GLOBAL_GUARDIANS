class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.boolean :active
      t.string :category
      t.string :name
      t.text :description
      t.integer :min_service_day
      t.integer :price_per_day
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
