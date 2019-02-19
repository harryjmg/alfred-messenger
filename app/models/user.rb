class User < ApplicationRecord
	require "facebook/messenger"

	include Facebook::Messenger

	after_create :set_private_id
	has_many :flow_entry

	def start_flow_test
		# Define random new Time
		tableau_intervalles = []
		total = 0
		current_time = Time.now
		begin
			nouveau_temps = (3600 + rand(5400))
			current_time = current_time + nouveau_temps
			total = total + nouveau_temps
			tableau_intervalles << current_time.iso8601
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
		send_text(self.psid, "Pause ! https://alfredcorp.typeform.com/to/hwJrHr?#{self.private_id}")
	end

	def end_of_day(message)
		send_text(self.psid, "Bonne nuit")
	end

	def set_private_id
		update_attribute(:private_id, SecureRandom.hex(4))
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
