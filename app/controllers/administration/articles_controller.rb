# frozen_string_literal: true

module Administration
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show edit update destroy publish unpublish]

    before_action :authenticate_user!,
                  only: %i[index show update edit create new destroy publish unpublish]

    def index
      @q = Article.kept.ransack(params[:q])
      @articles = @q.result(distinct: true)
    end

    def new
      @article = Article.new
      @users = User.all
      @categories = Category.all
    end

    def create
      @article = Article.new(article_params)

      @users = User.all
      @categories = Category.all

      if @article.save
        redirect_to administration_article_path(@article), notice: 'Article was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit
      @users = User.all
      @categories = Category.all
    end

    def update
      @users = User.all
      @categories = Category.all

      if @article.update(article_params)

        redirect_to administration_article_path(@article), notice: 'Article was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @article

      @article.discard!

      redirect_to :administration_articles, notice: 'Article was successfully destroyed.'
    end

    def publish
      authorize @article

      @article.published!

      redirect_to [:administration, @article], notice: 'Article published successfully'
    end

    def unpublish
      authorize @article

      @article.created!

      redirect_to [:administration, @article], notice: 'Article unpublished successfully'
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :slug, :status, :user_id, :category_id)
    end

    def set_article
      @article = Article.kept.find(params[:id])
    end
  end
end
