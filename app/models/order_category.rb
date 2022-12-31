class OrderCategory < ApplicationRecord
  belongs_to :order
  belongs_to :category
end