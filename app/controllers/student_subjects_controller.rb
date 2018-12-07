class StudentSubjectsController < ApplicationController

  def create
    student = Student.find(params[:student])
    student_subject = StudentSubject.create(student_id: student.id, subject_id: params[:subject])
    redirect_to student_path(student)
  end

  def destroy
    student = Student.find(params[:student])
    student_subject = StudentSubject.where(student_id: student.id, subject_id: params[:subject]).first
    student_subject.destroy
    redirect_to student_path(student)
  end

end