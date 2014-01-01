class TagsController < ApplicationController
before_filter :require_login, only: [:destroy]
	def index
		@tags = Tag.all
	end

	def show
	  @tag = Tag.find(params[:id])
	end
	
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag '#{@tag.name}' Has Been Deleted!"
		redirect_to tags_url
	end
end
