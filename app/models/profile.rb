class Profile < ApplicationRecord
	belongs_to :user

	has_one_attached :avatar

	validate :correct_birth_date

	def correct_birth_date
    	errors.add(:birthday, "can't be in the future") if !birthday.blank? and birthday > Date.today
  	end
end