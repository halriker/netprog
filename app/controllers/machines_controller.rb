class MachinesController < ApplicationController 
	def index 
		@machines = Machine.all.limit(10)
	end
end