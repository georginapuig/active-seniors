class AddDefaultValueToReviewsRatings < ActiveRecord::Migration[6.0]
  def change
    Review.where(rating: nil).update(rating: 0)
    change_column :reviews, :rating, :integer, default: 0, null: false 
  end
end
