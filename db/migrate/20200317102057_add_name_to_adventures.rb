class AddNameToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :name, :string
  end
end
