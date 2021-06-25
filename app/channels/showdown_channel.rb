class ShowdownChannel < ApplicationCable::Channel
  def subscribed
     stream_from "showdown_#{params[:sid]}"
     Rails.logger.info "Subscribed to Showdown Channe;"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
