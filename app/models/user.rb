class User < ApplicationRecord
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  enum role: %i(user worker admin) , _default: "user"
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/
  VALID_PHONE_REGEX = /\A[0-9]{10}\z/
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:25}
  validates :email, presence: true,uniqueness: {case_sensitive: false}, length: {maximum:105}, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum:8}, format: {with: VALID_PASSWORD_REGEX}
  validates :phone_number, presence: true, length: {minimum:10}, format: {with: VALID_PHONE_REGEX}
  
  has_secure_password
  
  before_save do 
    self.email = email.downcase
    self.user_categories.build(category: Category.find_by(name: 'دهان')) if self.categories.blank?
  end

  private

  def set_default_category
    self.user_categories.build(category: Category.find_by(name: 'دهان')) if self.categories.blank?
  end
end
