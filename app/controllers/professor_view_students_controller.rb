class ProfessorViewStudentsController < ApplicationController

  def index
    course = Course.find(params[:course_id])
    
    @students = course.students
    respond_to do |format|
      format.js
    end

  end

end
