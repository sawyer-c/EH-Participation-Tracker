class TypesController < ApplicationController

	def list
		@types = Type.all
	end

	def show_types
		@type = Type.find(params[:id])
	end
end