class Api::V1::EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

	# GET /events
	# GET /events.json
	def index
      @events = Event.page(params[:page])
      render json: @events
	end
  
	# GET /events/1
	# GET /events/1.json
    def show
        render json: @event
	end
  
	# GET /events/new
	def new
	  @event = Event.new
	end
  
	# GET /events/1/edit
	def edit
	end
  
	# POST /events
	# POST /events.json
	def create
	  @event = Event.new(event_params)
  
		if @event.save
		  render json: @event
		else
		  render error: {error: "unable to create event"}, status 400
		end
	end
  
	# PATCH/PUT /events/1
	# PATCH/PUT /events/1.json
	def update
		if @event.update(event_params)
		  render json: {message:"event updated successfully"}, status 200
		else
            render json: {error:"Unable to update event"}, status 400
		end
	end
  
	# DELETE /events/1
	# DELETE /events/1.json
    def destroy
        if @event
            @event.destroy
            render json: {message:"event destroyed successfully"}, status 200
        else
            render json: {error:"Unable to destroy event"}, status 400
	    end
	end
  
	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_event
		@event = Event.find(params[:id])
	  end
  
	  # Only allow a list of trusted parameters through.
	    def event_params
	        params.require(:event).permit(:name, :date, :description, :eventID, :type, :service)
        end
end