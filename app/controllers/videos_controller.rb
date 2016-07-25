class VideosController < ApplicationController
	def index
		@videos = Video.new
		@video1 = Video.last
	end

	def create #After submission of form in new, redirects straight to here. It's a rails thing
		@videos = Video.new(videos_params)
		if @videos.save
			redirect_to root_path
		else
			render :new
		end
	end

	def videos_params
    	params.require(:video).permit( :user_id, :video, :title, :description )
    end
end
