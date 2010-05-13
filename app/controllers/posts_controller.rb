class PostsController < ApplicationController
  before_filter :authenticate!, :only => [:new, :create, :manage]
  before_filter :prepare_post, :only => [:edit, :destroy, :update]
  
  def index
    @posts = Post.published.order('id desc')
  end
  
  def new
    @post = Post.new
  end
  
  def manage
    @posts = Post.scoped
  end
  
  def destroy
    @post.destroy
    redirect_to manage_posts_path, :notice => 'Post deleted.'
  end
  
  def update
    if @post.update_attributes params[:post]
      redirect_to manage_posts_path, :notice => 'Post updated.'
    else
      render :action => :edit
    end
  end
  
  def show
    @post = Post.find_by_permalink params[:permalink]
    redirect_to root_path, :alert => 'Page not found.' unless @post
  end
  
  def create
    @post = Post.new params[:post]
    @post.user = current_user
    if @post.save
      redirect_to manage_posts_path, :notice => 'Post created.'
    else
      render :action => 'new'
    end
  end
  
  private
  def prepare_post
    @post = Post.find params[:id]
  end
end
