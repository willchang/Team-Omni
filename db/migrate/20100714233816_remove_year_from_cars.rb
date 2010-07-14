class RemoveYearFromCars < ActiveRecord::Migration
  def self.up
    remove_column(:cars, :year)
  end

  def self.down
    add_column(:cars, :year, :integer)
  end
end
