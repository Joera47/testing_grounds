class Video < ActiveRecord::Base
	mount_uploader :video, UserVideoUploader
end
