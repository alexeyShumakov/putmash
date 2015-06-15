class VisitorsController < ApplicationController
	def index
		@valute = Valute.last
	end
end
