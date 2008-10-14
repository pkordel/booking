class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :person_id
      t.datetime :start_date, :default => Time.now.to_s(:db)
      t.datetime :end_date, :default => Time.now.to_s(:db)

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
