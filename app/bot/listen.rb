# app/bots/listen.rb
require "facebook/messenger"

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'

def answer(message, text)
	Bot.deliver({
		recipient: message.sender,
		message: {
		  text: text
		}
	}, access_token: ENV["ACCESS_TOKEN"])
end

Bot.on :message do |message|
	puts "Sender psid = #{message.sender}"

	message.mark_seen
	message.typing_on

	the_user = User.where(psid: message.sender["id"]).first
	if the_user.nil?
		the_user = User.new(psid: message.sender["id"])
		the_user.private_id = SecureRandom.hex(4)
		the_user.save
	end

	if (message.text.upcase.include? "START")
		the_user.update_attribute(:flow_testing, true)
		answer(message, "Début du test")
		the_user.start_flow_test
	elsif (message.text.upcase.include? "STOP")
		the_user.update_attribute(:flow_testing, false)
		answer(message, "Fin du test pour aujourd'hui")
	elsif (message.text.upcase.include? "LINK")
		answer(message, "Ton url : https://flowtracker03.herokuapp.com/flow_entries?id=#{the_user.private_id}")
	elsif (message.text.upcase.include? "HELP")
		answer(message, "Start / Stop / Link")
	else
		answer(message, "Harry ne m'a pas appris ta langue dsl")
	end
	message.typing_off
end

Bot.on :postback do |postback|
	postback.sender    # => { 'id' => '1008372609250235' }
	postback.recipient # => { 'id' => '2015573629214912' }
	postback.sent_at   # => 2016-04-22 21:30:36 +0200
	postback.payload   # => 'EXTERMINATE'

	if postback.payload == 'EXTERMINATE'
		puts "Human #{postback.recipient} marked for extermination"
	else
		puts "Coco"
	end
end
