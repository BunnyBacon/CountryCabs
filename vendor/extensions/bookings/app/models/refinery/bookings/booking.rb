module Refinery
  module Bookings
    class Booking < Refinery::Core::BaseModel
      self.table_name = 'refinery_bookings'

      attr_accessible :customer_name, :position

      acts_as_indexed :fields => [:customer_name, :customer_phone, :customer_email, :starting_location, :ending_location]

      validates :customer_name, :presence => true, :uniqueness => true
    end
  end
end
