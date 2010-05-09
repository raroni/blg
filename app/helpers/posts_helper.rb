module PostsHelper
  def link_to_post(post)
    link_to post.title, post
  end
end
