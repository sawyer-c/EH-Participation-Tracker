class Api::V1::StudentsController < ApplicationController
    before_action :set, only: [:show, :edit, :update, :destroy]

    # GET /students
    # GET /students.json
    def index
      @students = Student.page(params[:page])
      render json: @students
    end
  
    # GET /students/1
    # GET /students/1.json
    def show
        render json: @student
    end
  
    # GET /students/new
    def new
      @student = Student.new
    end
  
    # GET /students/1/edit
    def edit
    end
  
    # POST /students
    # POST /students.json
    def create
      @student = Student.new(student_params)
  
        if @student.save
          render json: @student
        else
          render error: {error:'Unable to create student'}, status 400
        end
    end
  
    # PATCH/PUT /students/1
    # PATCH/PUT /students/1.json
    def update
            if @student.update(student_params)
                render json: { message: 'student successfully updated.'}, status 200
            else
                render json: { error: 'Unable to update student.'}, status 400
            end
    end
  
    # DELETE /students/1
    # DELETE /students/1.json
    def destroy
        if @student
            @student.destroy
            render json: { message: 'student successfully destroyed.'}, status 200
            else
                render json: { error: 'Unable to destroy student.'}, status 400
            end
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
        def set_student
            @student = Student.find(params[:id])
        end
  
      # Only allow a list of trusted parameters through.
        def student_params
            params.require(:student).permit(:firstName, :lastName, :email, :uin, :gradYear, :major, :status)
        end
end
