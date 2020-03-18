class AddCoordinatesToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :latitude, :float
    add_column :adventures, :longitude, :float
  end
end
