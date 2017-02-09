class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @story = Story.new
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def create
    @story = Story.create(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
    @current_user = User.find_by_id(session[:current_user_id])
  end

  def show
    @story = Story.find(params[:id])
    @current_user = User.find_by_id(session[:current_user_id])
    @contribution = Contribution.new
    a = rand(300..600)
    b = rand(300..600)
    @random_image ="https://unsplash.it/"+a.to_s+"/"+b.to_s
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
