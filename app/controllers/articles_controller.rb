# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show]

  def index
    @articles = Article.all
  end

  def show; end

  private

  def article_params
    params.require(:article).permit(:title, :content, :slug, :status, :user_id, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
