class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
    @stylesheets = ['article']
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Rails.cache.fetch "article-#{params[:id]}" do
        Article.find(params[:id])
      end
    end
end
