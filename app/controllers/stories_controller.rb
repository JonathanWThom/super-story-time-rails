class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.create(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])

    @story.contributions.each do |contribution|
      contribution.destroy
    end
    @story.destroy

    redirect_to stories_path
  end

private
  def story_params
    params.require(:story).permit(:title)
  end
end
