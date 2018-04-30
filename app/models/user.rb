class User < ApplicationRecord
	require "facebook/messenger"

	include Facebook::Messenger

	has_many :flow_entry

	def start_flow_test
		# Define random new Time
		tableau_intervalles = []
		total = 0
		current_time = Time.now
		begin
			nouveau_temps = (3600 + rand(5400))
			total = total + nouveau_temps
			tableau_intervalles << (current_time + nouveau_temps).iso8601
		end until total > 80000

		intervalles = ""
		tableau_intervalles.each do |i|
			intervalles << i
			intervalles << " "
		end

		# Change User attributes in db
		current_user = self
		current_user.update_attributes(:flow_test_intervals => intervalles, :flow_testing => true)
	end	

	def flow_test_bip
		send_text(self.psid, "Tu fais quoi ? Tu te sens comment ? Etat de flow ? (Separe tes reponses par des points)")
	end

	def end_of_day(message)
		send_text(self.psid, "Bonne nuit Harry, j'espere que t'as bien tout niqué et que t'as respecté tes habitudes ! (Lever tot, Lecture, Procrastination, Video)")
		
		# habits = ["procrasinate", "read", "music"]
		# message.reply(
		#   attachment: {
		#     type: 'template',
		#     payload: {
		#       template_type: 'button',
		#       text: 'As tu procrastiné ?',
		#       buttons: [
		#         { type: 'postback', title: "J'ai tout niqué", payload: 'procrastinate_no' },
		#         { type: 'postback', title: "J'ai merdé", payload: 'procrastinate_yes' }
		#       ]
		#     }
		#   }
		# )
	end

	private

	def send_text(psid, text)
		Bot.deliver({
			recipient: {"id" => psid},
			message: {
			  text: text
			}
		}, access_token: ENV["ACCESS_TOKEN"])
	end
end
