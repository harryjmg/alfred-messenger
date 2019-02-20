class TypeformController < ApplicationController

  def webhook
    begin
      event = JSON.parse(request.body.read)

      form_response = event["form_response"]
      user_private_id = form_response["hidden"]["id"]
      tested_user = User.find_by(private_id: user_private_id)
      if tested_user.nil?
        render json: {:status => 400, :error => "ID can't be found"} and return
      end
      answers = form_response["answers"]
      flow_entry = FlowEntry.new(user: tested_user)
      i = 0
      answers.each do |answer|
        choice = answer[answer["type"]]
        flow_entry.write_attribute("#{FlowEntry::FLOW_ENTRY_ATTRIBUTES[i]}", choice)
        i = i + 1
      end
      flow_entry.save

    rescue JSON::ParserError => e
      render json: {:status => 400, :error => "Invalid payload"} and return
    rescue NoMethodError => e
      # missing event handler
    end

    render json: {:status => 200}
  end
end
