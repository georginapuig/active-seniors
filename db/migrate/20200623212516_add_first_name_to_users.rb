class AddFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
     add_column :users, :first_name, :string
  end
end
