class HeartsController < ApplicationController
	respond_to :js
	
	def heart
		@user = current_user
		@article = Article.find(params[:article_id])
		@user.heart!(@article)
	end
	
	def unheart
		@user = current_user
		@heart = @user.hearts.find_by_article_id(params[:article_id])
		@article = Article.find(params[:article_id])
		@heart.destroy!
	end
	
end
