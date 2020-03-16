class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.integer :number_of_guests
      t.string :location
      t.integer :price
      t.string :languages
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
