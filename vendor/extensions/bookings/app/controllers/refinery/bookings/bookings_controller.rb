module Refinery
  module Bookings
    class BookingsController < ::ApplicationController

      before_filter :find_all_bookings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @booking in the line below:
        present(@page)
      end

      def show
        @booking = Booking.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @booking in the line below:
        present(@page)
      end

    protected

      def find_all_bookings
        @bookings = Booking.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bookings").first
      end

    end
  end
end
