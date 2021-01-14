class Post < ApplicationRecord
	has_many_attached :images

	validates :title, presence: true
	validates :body, presence: true
	validate :image_type



private


    def image_type

    	if images.attached? == false
    		errors.add(:images, 'are missing!')
    	end




    	images.each do |image|


    		if !image.content_type.in? %('image/jpg image/jpeg image/png')

    			errors.add(:images, "needs to be a jpeg, jpg or png")

    		end

    	end

	end

	
end
