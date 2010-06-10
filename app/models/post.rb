class Post < ActiveRecord::Base
  belongs_to :user
  has_permalink :title
  
  scope :published, where('published_at < ?', Time.now)
  validates :title, :presence => true
  
  def published?
    published
  end
  
  def published
    !!published_at
  end
  
  def published=(published)
    self.published_at = nil unless published
  end
end
