class Restaurant < ActiveRecord::Base
	#place to do logic, can do in controller but it is better practice to do it here and call it in the controller
	# def multiply(num, num2)
	# 	ans = num*num2
	# end
	mount_uploader :image, ImageUploader

end
