class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :users, :username, :string
    end
  end
end
