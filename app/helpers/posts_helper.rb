module PostsHelper
  def link_to_post(post)
    link_to post.title, post
  end
  
  def link_to_delete_post(post)
    link_to 'Delete', post, :method => :delete, :confirm => 'Are you sure you want to delete this post?'
  end
end
