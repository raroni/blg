class Post < ActiveRecord::Base
  belongs_to :user
  has_permalink :title
  
  scope :published, where(:published => true)
  
  def to_param
    permalink
  end
end
