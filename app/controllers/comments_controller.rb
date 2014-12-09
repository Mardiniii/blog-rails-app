class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.build(comment_params)
		@comment.user = current_user
		@comment.save
		@article.number_of_comments = @article.number_of_comments + 1
		@article.save
		redirect_to article_path(@article, anchor: "comment_#{@comment.id}")
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if current_user == @comment.user
			@comment.destroy
			@article.number_of_comments = @article.number_of_comments - 1
			@article.save
			redirect_to article_path(@article)
		end
	end

	private
	def comment_params
	   	params.require(:comment).permit(:commenter, :body)
	end
end
