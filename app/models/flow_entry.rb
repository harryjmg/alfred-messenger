class FlowEntry < ApplicationRecord
	belongs_to :user

	scope :sorted_by_date, -> { order(:created_at )}

	def theorical_state
		if challenge_level.nil? || skill_level.nil?
			"None"
		elsif challenge_level > 2 && skill_level == 2
			"Stimulé"
		elsif challenge_level > 2 && skill_level < 2
			"Anxiété"
		elsif challenge_level == 2 && skill_level < 2
			"Inquiétude"
		elsif challenge_level < 2 && skill_level < 2
			"Apathie"
		elsif challenge_level < 2 && skill_level == 2
			"Ennui"
		elsif challenge_level < 2 && skill_level > 2
			"Relaxation"
		elsif challenge_level == 2 && skill_level > 2
			"Controle"
		elsif challenge_level > 2 && skill_level > 2
			"Flow"
		elsif challenge_level == 2 && skill_level == 2
			"Controle"
		end
	end

	def flow_potential
		attributes_to_count = [
			# 0 to 4 (@TODO to change 1 to 5 when saving in db)
			# "challenge_level",
	  	# "skill_level",
			# 1 to 5
	  	"feeling_competent",
	  	"mentally_absorbed",
	  	"clear_objectives",
	  	"control_situation",
	  	"free_from_ego",
	  	"free_from_time",
	  	"clear_conditions",
	  	"great_experience",
	  	"social_quality"
		]
		tab = []
		n = 0
		attributes_to_count.each do |a|
			j = read_attribute(a)
			next if j.nil?
			n = n + 1
			tab << j
		end
		flow_potential = (tab.sum / n.to_f * 20).to_i
	end

	def energy
		return nil if energy_level.nil?
		energy_level
	end

	def happiness
		return nil if happiness_level.nil?
		happiness_level
	end

	def social
		return nil if social_quality.nil?
		social_quality
	end

	FLOW_ENTRY_ATTRIBUTES = [
		"activity_name",
		"activity_category",
  	"skill_level",
  	"challenge_level",
  	"feeling_competent",
  	"mentally_absorbed",
  	"clear_objectives",
  	"control_situation",
  	"free_from_ego",
  	"free_from_time",
  	"clear_conditions",
  	"great_experience",
  	"is_voluntary",
		"energy_level",
  	"happiness_level",
  	"social_quality"
	]
end
