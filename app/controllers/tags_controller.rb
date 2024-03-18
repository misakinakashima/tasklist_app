class TagsController < ApplicationController
    def index
        tag = Tag.find_by(id: params[:tag_id])
        if tag
            @tag_name = tag.name
            @tasks = tag.tasks
        end
    end

    def new
        @tags = Tag.all
        @tag = Tag.new
    end

    def create
        @tag = Tag.new
        @tag.attributes = params.require(:tag).permit(:name)
        @tag.save!

        redirect_to tags_path
    rescue ActiveRecord::RecordInvalid
        render action: :new, status: :unprocessable_entity
    end

    def edit
        @tag = Tag.find params[:id]
    end

    def update
        @tag = Tag.find params[:id]
        @tag.attributes = params.require(:tag).permit(:name)
        @tag.save!

        redirect_to tags_path
    rescue ActiveRecord::RecordInvalid
        render action: :new, status: :unprocessable_entity
    end

    def destroy
        @tag = Tag.find params[:id]
        @tag.destroy
        redirect_to tags_path
    end

end
