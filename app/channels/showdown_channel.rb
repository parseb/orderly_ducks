class ShowdownChannel < ApplicationCable::Channel
  def subscribed
     stream_from "showdown_#{params[:sid]}"
     Rails.logger.info "Listening form SD_#{params[:sid]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end
end
