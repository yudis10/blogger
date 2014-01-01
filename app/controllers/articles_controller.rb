class ArticlesController < ApplicationController
include ArticlesHelper
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_filter :require_login, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
	  @article.save
	  flash.notice = "Article '#{@article.title}' Created!"
	  redirect_to article_path(@article)
	end

	def edit
	end

	def update
		@article.update(article_params)
		flash.notice = "Article '#{@article.title}' Updated!"
	  redirect_to article_path(@article)
	end

	def destroy
		@article.destroy
		flash.notice = "Article '#{@article.title}' Deleted!"
		redirect_to articles_url
	end
end