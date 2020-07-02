class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user

    if @message.save
      redirect_to booking_path(@booking, anchor: "message-#{@message.id}")
    else
      render "bookings/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
