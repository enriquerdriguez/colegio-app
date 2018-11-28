class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Student created successfully"
      redirect_to student_path(@student)
    else
      flash[:danger] = "There was a problem creating the student"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Student updated Succesfully"
      redirect_to student_path(@student)
    else
      flash[:danger] = "Student couldnt be updated"
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:danger] = "Student was successfully deleted"
    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :telephone, :picture, :birthdate)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end