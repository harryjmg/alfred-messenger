class FlowEntriesController < ApplicationController

	def index
		@flow_entries = User.find_by(psid: params[:id])&.flow_entries
	end
end
