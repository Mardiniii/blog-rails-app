class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
 
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
	end


	def edit
		@article = Article.find(params[:id])
	end

	def show
  		@article = Article.find(params[:id])
  		@comments = @article.comments
  		@mostrar_editar = true
	end

	def update
		@article = Article.find(params[:id])
	 
  		if @article.update(article_params)
	    	redirect_to @article
		else
	    	render 'edit'
	  	end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	 
		redirect_to articles_path
	end

	private
  		def article_params
    		params.require(:article).permit(:title, :author, :text)
  		end
end
