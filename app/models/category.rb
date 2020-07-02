class Category < ApplicationRecord

  has_many :offers

  def self.categories
    Category.where(parent_id: nil)
  end

  def self.subcategories
    Category.where.not(parent_id: nil)
  end

  def subcategories
    Category.where(parent_id: self.id)
  end
end
