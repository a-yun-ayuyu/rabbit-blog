class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: current_user.id)
    redirect_to "/posts/#{comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
