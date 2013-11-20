class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	mount_uploader :image, ImageUploader
	belongs_to :owner
	mount_uploader :menu, MenuUploader
	
end
