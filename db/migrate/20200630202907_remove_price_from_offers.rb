class RemovePriceFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :price, :integer
  end
end
