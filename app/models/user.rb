class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
	has_many :orders, dependent: :destroy
	has_many :addresses, dependent: :destroy

	def self.find_or_create_by_auth(auth_data)
		find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"], name: auth_data["info"]["name"])
	end

end
