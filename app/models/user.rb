class User < ActiveRecord::Base
	mount_base64_uploader :profile_photo, WebcamPhotoUploader
end
