# require 'awesome_print'

class ArticlesController < ApplicationController

    before_action :authenticate_user!,
        except: [:index, :show]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find params[:id]
    end

    def new
        @article = current_user.articles.new
    end

    def edit
        @article = Article.find params[:id]
    end

    def create
        @article = current_user.articles.create article_params

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find params[:id]

        if @article.update article_params
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find params[:id]
        @article.destroy
        render articles_path
    end

    private

        def article_params
            params.require(:article)
                .permit(:title, :body)
        end

end
