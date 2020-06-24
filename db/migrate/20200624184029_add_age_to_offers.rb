class AddAgeToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :age, :integer
  end
end
