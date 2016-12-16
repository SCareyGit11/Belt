class Song < ApplicationRecord
	has_many :adds
	has_many :users, through: :adds

	validates :artist, length: {minimum: 2}
	validates :title, uniqueness: {case_sensitive: false}, length: {minimum: 2}
end
