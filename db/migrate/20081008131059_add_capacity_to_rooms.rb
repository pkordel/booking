class AddCapacityToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms, :capacity, :integer, :default => 0
  end

  def self.down
    remove_column :rooms, :capacity
  end
end
