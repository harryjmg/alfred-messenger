class FlowEntriesController < ApplicationController

	def index
		@flow_entries = FlowEntry.where(user_id: params[:id])
	end

end