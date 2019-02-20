class FlowEntry < ApplicationRecord
	belongs_to :user

	FLOW_ENTRY_ATTRIBUTES = [
		"activity_name",
		"activity_categorty",
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
