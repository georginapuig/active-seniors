class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :offer

  has_many :reviews
  has_many :messages
  has_many :users, through: :messages

  validates :start_date, :end_date, presence: true

  def hours
    (end_date - start_date) / 3600
  end

  def subtotal
    hours * offer.price
  end

  def vat
    subtotal * 0.2
  end

  def grand_total
    subtotal + vat
  end

  def grand_total_in_cents
    (grand_total * 100).to_i
  end

  def display_name
    "Booking #{offer.user.first_name} for #{hours_amount} hours"
  end

  def hours_amount
    (end_date - start_date).to_i / 3600
  end

  def display_image
    offer.user.photo
  end

  def created_by?(given_user)
    user == given_user
  end
  # validates :end_date_after_start_date

  # private

  # def end_date_after_start_date
  #   re turn if end_date.blank? || start_date.blank?

  # if end_date < start_date
  #   errors.add(:end_date, "must be after the start date")
  # end
  # end
end
