class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.text :description
      t.string :location
      t.integer :price
      t.references :category, null: false
      t.references :subcategory, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
      add_foreign_key :offers, :categories, column: :category_id, primary_key: :id
      add_foreign_key :offers, :categories, column: :subcategory_id, primary_key: :id
  end
end
