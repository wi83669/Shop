class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip, :user_id
	validates :line1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, length: 5, :numericality { only_integer: true }
	validates :user_id, presence: true
end
