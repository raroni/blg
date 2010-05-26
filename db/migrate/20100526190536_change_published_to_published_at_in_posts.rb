class ChangePublishedToPublishedAtInPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :published
    add_column :posts, :published_at, :datetime
  end

  def self.down
    add_column :posts, :published, :boolean, :null => false
    remove_column :posts, :published_at
  end
end
