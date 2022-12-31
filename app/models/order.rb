class Order < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :order_categories
  has_many :categories, through: :order_categories
  validates :categories, presence: true
  scope :by_categories, -> (categories) {
    joins(:categories).where(categories: { id: categories })
  }
end
