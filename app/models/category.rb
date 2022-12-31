class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:25}
  has_many :order_categories
  has_many :orders, through: :order_categories
end