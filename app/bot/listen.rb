# app/bots/listen.rb
require "facebook/messenger"

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

def answer(message, text)
	Bot.deliver({
		recipient: message.sender,
		message: {
		  text: text
		}
	}, access_token: ENV["ACCESS_TOKEN"])
end

def send_to_all_recent_users text
	n = 0
	User.all.each do |u|
		next if u.updated_at < (Time.now - 1.month)
		n += 1
		u.send_text(text)
	end
	return n
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
		message.typing_off
		answer(message, "Bienvenue maggl. Alors le but ici c'est de relever ton état d'esprit au quotidien dans le but d'améliorer ta vie. Moi c'est Alfred et je suis principalement la pour te rappeler de répondre a un questionnaire a des intervalles aléatoires. Voila voila. Sinon les commandes que tu peux utiliser a partir de maintenant sont les suivantes [Start / Stop / Link / Help]. Des bisous")
	else
		message.typing_off
		if (message.text&.upcase&.include? "START")
			the_user.update_attribute(:flow_testing, true)
			answer(message, "Début du test. Bonne journée !")
			the_user.start_flow_test
		elsif (message.text&.upcase&.include? "STOP")
			the_user.update_attribute(:flow_testing, false)
			answer(message, "Fin du test pour aujourd'hui.")
		elsif (message.text&.upcase&.include? "LINK")
			answer(message, "Ton url : https://flowtracker03.herokuapp.com/flow_entries?id=#{the_user.private_id} . Si tu as des idées pour rendre plus pertinent l'affichage de tes résultats n'hésite pas a en parler a Harry (pas moi pcq je capte rien de ce que tu dis)")
		elsif (message.text&.upcase&.include? "HELP")
			answer(message, "Start / Stop / Link . C'est pas sorcier")
		elsif (message.text&.upcase&.include? "Message Harry :" && the_user.role == "admin")
			# Broadcast a message to all recent users
			answer(message, "Broadcast launched")
			answer(message, "Successfully sent to #{send_to_all_recent_users(message.text)} recent users (total users : #{User.all.count})")
		else
			answer(message, "Harry ne m'a pas appris ta langue dsl")
		end
	end
end
