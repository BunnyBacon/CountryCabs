
FactoryGirl.define do
  factory :booking, :class => Refinery::Bookings::Booking do
    sequence(:customer_name) { |n| "refinery#{n}" }
  end
end

