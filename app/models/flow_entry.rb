class FlowEntry < ApplicationRecord
	belongs_to :user

	def theorical_state
		if challenge_level.nil? || skill_level.nil?
			"None"
		elsif challenge_level > 3 && skill_level == 3
			"Stimulé"
		elsif challenge_level > 3 && skill_level < 3
			"Anxiété"
		elsif challenge_level == 3 && skill_level < 3
			"Inquiétude"
		elsif challenge_level < 3 && skill_level < 3
			"Apathie"
		elsif challenge_level < 3 && skill_level == 3
			"Ennui"
		elsif challenge_level < 3 && skill_level > 3
			"Relaxation"
		elsif challenge_level == 3 && skill_level > 3
			"Controle"
		elsif challenge_level > 3 && skill_level > 3
			"Flow"
		end
	end

	FLOW_ENTRY_ATTRIBUTES = [
		"activity_name",
		"activity_category",
  	"challenge_level",
  	"skill_level",
  	"feeling_competent",
  	"mentally_absorbed",
  	"clear_objectives",
  	"control_situation",
  	"free_from_ego",
  	"free_from_time",
  	"clear_conditions",
  	"great_experience",
  	"is_voluntary",
  	"happiness_level",
  	"social_quality"
	]
end
