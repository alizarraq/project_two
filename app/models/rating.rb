class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rater, class_name: "User"
  validates :user_id, presence: true
  validates :rater_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  # validate :not_self_rating, :user_can_be_rated_once
  
  private
    def not_self_rating
      errors.add(:rater_id, "can't be the same as user_id") if user_id == rater_id
    end

    def user_can_be_rated_once
      errors.add(:user_id, "can be rated only once by the same rater") if Rating.exists?(user_id: user_id, rater_id: rater_id)
      errors.add(:user_id, "can be rated only once by the same rater") if Rating.exists?(user_id: rater_id, rater_id: user_id)
    end
end
