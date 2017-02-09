class ContributionsController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new
  end

  def create
    @user = User.find_by_id(session[:current_user_id])
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.create(content: contribution_params[:content], image: contribution_params[:image], user_id: @user.id)
    if @contribution.save
      redirect_to story_path(@story)
    else
      flash[:notice] = 'Contribution denied'
      redirect_to story_path(@story)
    end

  end

private
  def contribution_params
    params.require(:contribution).permit(:content, :image)
  end
end
