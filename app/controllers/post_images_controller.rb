class PostImagesController < ApplicationController
	def index
    @post_images = PostImage.all
	end
	def new
    end
    def create
    end
    def show
    end
end
