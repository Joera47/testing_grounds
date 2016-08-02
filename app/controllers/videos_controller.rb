class VideosController < ApplicationController
	def index
		@videos = Video.order('created_at DESC')
		
	end

	def new
		@video = Video.new
	end

	def edit
		@video = Video.find(params[:id])
		@link = 'http://youtube.com/watch?v=' + @video.uid
		@youtube_video = Yt::Video.new url: @link
		byebug
	end

	def create
  		@video_upload = VideoUpload.new(title: params[:video_upload][:title],
                                  description: params[:video_upload][:description],
                                  file: params[:video_upload][:file].try(:tempfile).try(:to_path))
	if @video_upload.save
		uploaded_video = @video_upload.upload!(current_user)

		# check if the video was uploaded or not

		redirect_to root_url
	else
		render :new
	end
end

	private
	def video_params
		params.require(:video).permit(:link)
	end
end
