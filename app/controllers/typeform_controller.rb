class TypeformController < ApplicationController

  def webhook
    begin
      event = JSON.parse(request.body.read)
      method = "handle_" + event['type'].tr('.', '_')
      self.send method, event
    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    rescue NoMethodError => e
      # missing event handler
    end
    render json: {:status => 200}
  end
end
