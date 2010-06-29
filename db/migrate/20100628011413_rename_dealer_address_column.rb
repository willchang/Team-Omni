class RenameDealerAddressColumn < ActiveRecord::Migration
  def self.up
    rename_column :dealers, :address1, :address
  end

  def self.down
    rename_column :dealers, :address, :address1
  end
end
