class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	def new
		if current_user.writer
			@article = Article.new
			@permission = true
		else
			@permission = false
			redirect_to articles_path
		end
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user
  		if @article.save
  			redirect_to @article
  		else
  			puts @article.errors.full_messages
  			render 'new'
  		end
	end

	def index
  		@articles = Article.all
  		@lastfive = Article.order('created_at DESC').limit(5)
  		@mostcommented = Article.order('number_of_comments DESC').limit(5)
	end


	def edit
		@article = Article.find(params[:id])
		if current_user == @article.user
			render 'edit'
		else 
			redirect_to articles_path
		end		
	end

	def show
  		@article = Article.find(params[:id])
  		@comments = @article.comments
  		if current_user == @article.user
  			@mostrar_editar = true
  		else
  			@mostrar_editar = false
  		end
	end

	def update
		@article = Article.find(params[:id])
	 	if current_user == @article.user
	  		if @article.update(article_params)
		    	redirect_to @article
			else
		    	render 'edit'
		  	end
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if current_user == @article.user
			@article.destroy
			redirect_to articles_path
		end
	end

	private
  		def article_params
    		params.require(:article).permit(:title, :author, :text)
  		end
end
