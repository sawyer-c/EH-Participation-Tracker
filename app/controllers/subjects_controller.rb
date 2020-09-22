class SubjectsController < ApplicationController

    def list
        @subjects = Subject.all
    end

    def show_subjects
       @subject = Subject.find(params[:id])
    end

end
