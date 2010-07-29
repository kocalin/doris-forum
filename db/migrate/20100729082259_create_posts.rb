class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :forum_id
      t.text :body
      t.timestamps
    end
    Forum.reset_column_information
	Forum.find(:all).each do |p|
	Forum.update_counters p.id, :posts_count => p.posts.length
    end
  end

  def self.down
    drop_table :posts
  end
end
