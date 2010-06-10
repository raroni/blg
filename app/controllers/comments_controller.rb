class CommentsController < ApplicationController
  before_filter :authenticate!, :only => :destroy
  
  def create
    post = Post.find params[:post_id]
    comment = post.comments.build params[:comment]
    
    if comment.save
      redirect_to public_post_path(post), :notice => "Thanks for commenting."
    else
      redirect_to public_post_path(post), :alert => "There was an error saving your comment."
    end
  end
  
  def destroy
    post = Post.find params[:post_id]
    comment = post.comments.find params[:id]
    comment.destroy
    redirect_to public_post_path(post), :notice => "The comment was deleted."
  end
end
