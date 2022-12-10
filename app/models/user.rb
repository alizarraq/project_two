class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :orders, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/
  VALID_PHONE_REGEX = /\A[0-9]{10}\z/
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:25}
  validates :email, presence: true,uniqueness: {case_sensitive: false}, length: {maximum:105}, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum:8}, format: {with: VALID_PASSWORD_REGEX}
  validates :phone_number, presence: true, length: {minimum:10}, format: {with: VALID_PHONE_REGEX}
  has_secure_password
end
