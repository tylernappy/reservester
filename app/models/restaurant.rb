class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader

	belongs_to :owner
	has_many :reservations, :dependent => :destroy
	accepts_nested_attributes_for :reservations
end
