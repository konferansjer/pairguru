class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_movie!

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user

    if @comment.save 
      redirect_back(fallback_location: root_path, notice: 'Thanks for commenting on this movie!')
    else
      redirect_back(fallback_location: root_path, alert: @comment.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @comment = Comment.find_by({id: params[:id], user_id: current_user.id})
    if @comment
      @comment.destroy
      redirect_back(fallback_location: root_path, notice: 'Successfully deleted comment')
    else
      redirect_back(fallback_location: root_path, alert: 'Cannot delete others comments')
    end
  end

  private

  def find_movie!
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
