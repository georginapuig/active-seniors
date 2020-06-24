class AddAgeGenderPhotoToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :age, :integer
    remove_column :offers, :photo, :string
    add_column :users, :photo, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
  end
end
