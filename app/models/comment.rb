class Comment < ApplicationRecord
  belongs_to :order
  belongs_to :user

  attribute :status, :string, default: "pending"
end
