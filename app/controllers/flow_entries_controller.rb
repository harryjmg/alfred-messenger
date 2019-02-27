class FlowEntriesController < ApplicationController

	def index
		@flow_entries = FlowEntry.where(user: User.find_by(private_id: params[:id]))&.order(created_at: :desc).group_by{ |t| t.created_at.to_date }

		if @flow_entries.nil?
			@flow_entries_error = [ true, "Utilisateur non trouvé. As tu utilisé le bon lien ?" ]
		elsif @flow_entries.count == 0
			@flow_entries_error = [ true, "Pas encore de données, lance le test et passe ta journée normalement" ]
		else
			@flow_entries_error = [ false, "Ok" ]
		end

	end
end
