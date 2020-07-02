class AddBookingRefToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :booking, null: false, foreign_key: true
  end
end
