class AddLngLatColumnToDealers < ActiveRecord::Migration
  def self.up
    add_column :dealers, :lat, :float, :null => false, :precision => 10,
                :scale => 6, :default => 0
    add_column :dealers, :lng, :float, :null => false, :precision => 10,
                :scale => 6, :default => 0
  end

  def self.down
    remove_column :dealers, :lat
    remove_column :dealers, :lng
  end
end
