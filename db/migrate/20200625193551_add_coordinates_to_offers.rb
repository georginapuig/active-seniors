class AddCoordinatesToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
  end
end
