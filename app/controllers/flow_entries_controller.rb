class FlowEntriesController < ApplicationController

	def index
		@flow_entries = User.find_by(private_id: params[:id])&.flow_entry
	end
end
