class EventsController < ApplicationController
	def list
		@events = Event.all
	end

	def new
		@event = Event.new
		@types = Type.all
	end

	def event_params
		params.require(:events).permit(:name, :date, :description, :eventID, :type, :service)
	end

	def create
		@event = Event.new(event_params)
		
		if @event.save
			redirect_to :action => 'list'
		else
			@types = Type.all
			render :action => 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
		@types = Type.all
	end

	def event_param
		params.require(:event).permit(:name, :date, :description, :eventID, :type, :service)
	end

	def update
		@event = Event.find(params[id])

		if @event.update_attributes(event_param)
			redirect_to :action => 'show', :id => @event
		else
			@types = Type.all
			render :action => 'edit'
		end
	end

	def delete
		Event.find(params[:id]).destroy
		redirect_to :action => 'list'
	end
end