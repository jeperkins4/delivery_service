class RefreshPlaceServingTimeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # This is also in app/channels/place_channel.rb
    args.each do |message|
      ActionCable.server.broadcast 'place_channel', message: message
    end
    # Do something later
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
