class Person < ActiveRecord::Base
  has_many :bookings, :dependent => :destroy
  has_many :rooms, :through => :bookings
end
