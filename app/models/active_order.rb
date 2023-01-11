class ActiveOrder < ApplicationRecord
  belongs_to :worker, class_name: "User"  
  belongs_to :user
  has_many_attached :images
  # Add any additional validations or associations as needed
end
