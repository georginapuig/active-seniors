class Checkout < ApplicationRecord
  monetize :amount_cents

  belongs_to :user
  belongs_to :offer
end
