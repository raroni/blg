class Comment < ActiveRecord::Base
  validates :text, :presence => true
  
  before_validation :check_website_for_protocol, :on => :create
  
  def check_website_for_protocol
    self.website = "http://#{website}" if website? && !website.starts_with?('http')
  end
end
