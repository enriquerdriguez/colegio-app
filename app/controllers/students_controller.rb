class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.paginate(page: params[:page], per_page: 4)
  end
end