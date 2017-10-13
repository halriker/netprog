class MachinesController < ApplicationController 

	PAGE_SIZE = 10

	def index 

		@page = (params[:page] || 0).to_i

		if params[:keywords].present?
			@keywords = params[:keywords]
			machine_search_term = MachineSearchTerm.new(@keywords)
			@machines = Machine.where(machine_search_term.where_clause, machine_search_term.where_args).order(machine_search_term.order).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
		else
			@machines = []
		end
	end
end