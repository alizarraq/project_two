class Comment < ApplicationRecord
  belongs_to :order
  belongs_to :worker, class_name: "User"

  attribute :status, :string, default: "pending"
end
