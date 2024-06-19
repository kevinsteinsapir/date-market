class AddCoordinatesToDatexes < ActiveRecord::Migration[7.1]
  def change
    add_column :datexes, :latitude, :float
    add_column :datexes, :longitude, :float
  end
end
