# frozen_string_literal: true

module Administration
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]

    before_action :authenticate_user!, only: %i[index show update edit create new destroy]

    def index
      @categories = Category.all

      authorize @categories
    end

    def new
      @category = Category.new

      authorize @category
    end

    def create
      @category = Category.new(category_params)
      authorize @category

      if @category.save
        redirect_to administration_category_path(@category), notice: 'Category was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      authorize @category
    end

    def edit
      authorize @category
    end

    def update
      authorize @category

      if @category.update(category_params)

        redirect_to administration_category_path(@category), notice: 'Category was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @category

      @category.destroy!

      redirect_to :administration_categories, notice: 'Category was successfully destroyed.'
    end

    private

    def category_params
      params.require(:category).permit(:name, :slug, :parent_id)
    end

    def set_category
      @category = Category.find(params[:id])
    end
  end
end
