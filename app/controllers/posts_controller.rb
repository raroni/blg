class PostsController < ApplicationController
  before_filter :authenticate!, :only => [:new, :create]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    if @post.save
      redirect_to users_path, :notice => 'Post created.'
    else
      render :action => 'new'
    end
  end
end
