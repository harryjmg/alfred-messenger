# app/bots/listen.rb
require "facebook/messenger"

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'

# Bonjour : flow on
# Bonne nuit : flow off + ask habits
# Help : 
# 

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

	the_user = User.find_by(psid: message.sender["id"])
	if the_user == nil
		the_user = User.create(psid: message.sender["id"])
	end

	if (message.text.include? "Bonjour")
		the_user.update_attribute(:flow_testing, true)
		answer(message, "Bonjour ! Souviens toi que tout niquer tu dois")
		the_user.start_flow_test
	elsif (message.text.include? "Bonne nuit")
		the_user.update_attribute(:flow_testing, false)
		the_user.end_of_day(message)
	elsif (message.text.include? "psid?")
		answer(message, "Ton url : https://secure-ravine-43937.herokuapp.com/flow_entry?id={the_user.id}")
	elsif (message.text.include? "help?")
		answer(message, "Mode d'emploi : Bonjour pour demarrer, Bonne nuit pour arreter, psid? pour aller voir ton recapitulatif, pour les entrees du flow test suivre ce format : Je fais x. Je me sens bien. Oui (ou non)")
	elsif message.text.count('.') == 2
		splitted = message.text.split('.')
		the_user.flow_entry.create!(what: splitted[0], feeling: splitted[1], flow: splitted[2])
	else
		answer(message, "Je panique.")
	end
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


