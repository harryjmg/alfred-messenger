class FlowEntriesController < ApplicationController

	def index
		@user = User.find_by(private_id: params[:id])
		@flow_entries = FlowEntry.where(user: @user)&.order(created_at: :desc).group_by{ |t| t.created_at.to_date }

		@private_mode = false
		if params[:private_mode] && params[:private_mode] == "true"
			@private_mode = true
		end

		if @user.nil?
			@flow_entries_error = [ true, "Utilisateur non trouvé. As tu utilisé le bon lien ?" ]
		elsif @flow_entries&.count == 0
			if @user.flow_testing?
				@flow_entries_error = [ true, "Tu as bien lancé le test, maintenant surveille simplement les messages d'Alfred" ]
			else
				@flow_entries_error = [ true, "Tu n'as pas encore lancé le test, dis 'Start' a Alfred pour le faire" ]
			end
			else
			@flow_entries_error = [ false, "Ok" ]
		end

	end
end
