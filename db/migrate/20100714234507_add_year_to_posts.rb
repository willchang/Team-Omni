class AddYearToPosts < ActiveRecord::Migration
  def self.up
    add_column(:posts, :year, :integer)
  end

  def self.down
    remove_column(:posts, :year)
  end
end
