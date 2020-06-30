class AddPriceToOffers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :offers, :price, currency: { present: false }
  end
end
