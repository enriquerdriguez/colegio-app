class ChangeCoursesController < ApplicationController
  def new
    if !current_user
      flash[:danger] = "You are not allowed to perform that action bro"
      redirect_to root_path
    end
    @courses = Course.all
    @student = Student.find(params[:student_id])
  end

  def create
    if !current_user
      flash[:danger] = "You are not allowed to perform that action bro"
      redirect_to root_path
    end
    student = Student.find(params[:student_id])
    course = Course.find(params[:course_id])
    #delete_asocciations(student)
    student.course = course
    student.save
    #add_associations(student,course)
    redirect_to student_path(student)

  end

  private
  def delete_asocciations(student)
    old_course = student.course
    old_subjects = old_course.subjects
    old_subjects.each do |subject|
      relation = StudentSubject.where(student_id: student.id, subject_id: subject.id).first
      unless !relation
        relation.destroy
      end
    end
  end

  def add_associations(student, course)
    subjects = course.subjects
    # crear asociaciones student - course.subjects
    if !subjects.nil?
      subjects.each do |subject|
        StudentSubject.create(student_id: student.id, subject_id: subject.id)
      end
    end
  end


end