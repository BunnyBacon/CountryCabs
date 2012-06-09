module Refinery
  module Bookings
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Bookings

      engine_name :refinery_bookings

      initializer "register refinerycms_bookings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "bookings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bookings_admin_bookings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bookings/booking',
            :title => 'customer_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Bookings)
      end
    end
  end
end
