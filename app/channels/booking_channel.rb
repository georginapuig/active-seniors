class BookingChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    def subscribed
      booking = Booking.find(params[:id])
      stream_for booking
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
