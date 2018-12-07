class CourseSubjectsController < ApplicationController

  before_action :set_course_subject, only:[ :edit, :update, :destroy]

  def create
    @course_subject = CourseSubject.create(params_course_subject)
    flash[:success] = "Subject added successfully"
    redirect_to course_path(Course.find(params[:course_id]))
  end

  def destroy
    course = @course_subject.course
    @course_subject.destroy
    flash[:danger] = "Subject deleted successfully"
    redirect_to course_path(course)
  end

  def new
    @course_subject = CourseSubject.new(params_course_subject)
    @professors = Professor.all

    respond_to do |format|
      format.js
    end

  end

  def edit
    @professors = Professor.all

    respond_to do |format|
      format.js
    end
  end

  def update
    @course_subject.update(professor_id: params[:professor_id])
    flash[:success] = "Professor changed successfully"
    redirect_to course_path(Course.find(@course_subject.course.id))
  end

  private
  def set_course_subject
    @course_subject = CourseSubject.find(params[:course_subject])
  end

  def params_course_subject
    params.permit(:id,:course_id, :subject_id, :professor_id)
  end

end