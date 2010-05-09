class Post < ActiveRecord::Base
  belongs_to :user
  has_permalink :title  
end
