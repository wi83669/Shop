class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip, :user
	validates :line1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true, numericality: { only_integer: true, is: 5}
	validates :user_id, presence: true

	belongs_to :user, foreign_key: :user_id
	has_many :orders

	def to_s
		str = ""
		str += line1
		str += " | " + line2 if !line2.nil?
		
		return str
	end
end
