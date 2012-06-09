class CreateBookingsBookings < ActiveRecord::Migration

  def up
    create_table :refinery_bookings do |t|
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_email
      t.string :starting_location
      t.string :ending_location
      t.datetime :initial_pickup
      t.datetime :secondary_pickup
      t.integer :passenger_count
      t.integer :price
      t.integer :cab_type
      t.datetime :completed
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bookings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bookings/bookings"})
    end

    drop_table :refinery_bookings

  end

end
