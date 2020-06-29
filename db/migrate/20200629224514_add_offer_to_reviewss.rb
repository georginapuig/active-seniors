class AddOfferToReviewss < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :offer, null: false, foreign_key: true
  end
end
