class Order < ApplicationRecord
  belongs_to :user
  has_many :order_categories
  has_many :categories, through: :order_categories
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :categories, presence: true
  
  scope :by_categories, -> (categories) {
    joins(:categories).where(categories: { id: categories })
  }
  has_one :active_order
end
