# frozen_string_literal: true

module Administration
  class TagsController < ApplicationController
    before_action :set_tag, only: %i[show edit update destroy]

    before_action :authenticate_user!, only: %i[index show update edit create new destroy]

    def index
      @tags = Tag.all

      authorize @tags
    end

    def new
      @tag = Tag.new

      authorize @tag
    end

    def create
      @tag = Tag.new(tag_params)
      authorize @tag

      if @tag.save
        redirect_to administration_tag_path(@tag), notice: 'Tag was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      authorize @tag
    end

    def edit
      authorize @tag
    end

    def update
      authorize @tag

      if @tag.update(tag_params)

        redirect_to administration_tag_path(@tag), notice: 'Tag was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @tag

      @tag.destroy!

      redirect_to :administration_tags, notice: 'Tag was successfully destroyed.'
    end

    private

    def tag_params
      params.require(:tag).permit(:name, :slug)
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end
  end
end
