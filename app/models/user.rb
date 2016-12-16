class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 4}

  has_many :adds
  has_many :songs, through: :adds
end
