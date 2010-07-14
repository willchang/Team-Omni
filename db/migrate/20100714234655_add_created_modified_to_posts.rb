class AddCreatedModifiedToPosts < ActiveRecord::Migration
  def self.up
    add_column(:posts, :created_at, :datetime)
    add_column(:posts, :modified_at, :datetime)
  end

  def self.down
    remove_column(:posts, :created_at)
    remove_column(:posts, :modified_at)
  end
end
