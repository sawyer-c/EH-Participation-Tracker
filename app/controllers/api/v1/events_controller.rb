module Api
    module V1
        class EventsController < ApplicationController
            def index
                students = Event.all

                render json: EventSerializer.new(student).serialized_json
            end

            def show
                student = Event.find_by(eventID: params[:eventID])

                render json: EventSerializer.new(student).serialized_json
            end

            def create
                student = Event.new(student_params)

                if student.save
                    render json: EventSerializer.new(student).serialized_json
                else 
                    render json: {error: student.errors.messages}, status: 422
                end
            end

            def update
                student = Event.find_by(eventID: params[:eventID])

                if student.update(student_params)
                    render json: EventSerializer.new(student).serialized_json
                else 
                    render json: {error: student.errors.messages}, status: 422
                end
            end

            def destroy

                if student.destroy
                    head :no_content
                else 
                    render json: {error: student.errors.messages}, status: 422
                end
            end


            private

            def student_params
                params.require(:student).permit(:name, :date, :description, :type, :eventID, :service)
            end
        end
    end
end