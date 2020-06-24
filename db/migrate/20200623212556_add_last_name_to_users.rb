class AddLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
     add_column :users, :last_name, :string
  end
end
