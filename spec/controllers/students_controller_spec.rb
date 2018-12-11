require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  before(:each) do
    @course = FactoryBot.create(:course)
    @student = FactoryBot.create(:student, course_id: @course.id)
  end

  describe "GET" do
    it "render new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "render edit/:id template" do
      get :edit, :params => { :id => 1 }
      expect(response).to render_template("edit")
    end

  end

  describe "POST" do
    it "create call" do
      expect{FactoryBot.create(:student, course_id: @course.id, email: 'example@ample.com')}.to change{Student.count}.by(1)
    end

  end

  describe "PUT" do
    it "update call" do
      post :update, :params => {id: @student, student: {first_name: 'Update', last_name: 'Updated', email: 'updated@updated.updated', course_id: 1, telephone: nil, picture: nil, birthdate: nil}}
      @student.reload
      expect(@student.email).to eq("updated@updated.updated")
      expect(response).to redirect_to(@student)
    end

  end

  describe "DELETE" do
    it "destroy call" do
      delete :destroy, :params => {id: @student}
      #Create one student before the test, if we delete it, we expect 0.
      expect(Student.count).to eq(0)
      expect(response).to redirect_to students_path
    end
  end

end
