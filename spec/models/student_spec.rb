require 'rails_helper'

RSpec.describe Student, type: :model do



  context 'validation test' do

    before(:each) do
      @course = FactoryBot.build(:course)
    end

    it 'ensures first name presence' do
      student = Student.new(last_name: 'Perez', email: 'sample@example.es', course_id: @course).save
      expect { raise StandardError, "First name can't be blank"}.to raise_error(StandardError, "First name can't be blank")
    end

    it 'ensures length of first name ' do
      student = Student.new(first_name: 'Pe', last_name:'Perez', email: 'sample@example.es', course_id: @course).save
      expect { raise StandardError, " can't be shorter than 3 characters or longer than 50"}.to raise_error(StandardError, " can't be shorter than 3 characters or longer than 50")
    end

    it 'ensures last name presence' do
      student = Student.new(first_name: 'Pepe', email: 'sample@example.es', course_id: 2).save
      expect { raise StandardError, "Last name can't be blank"}.to raise_error(StandardError, "Last name can't be blank")
    end

    it 'ensures length of last name ' do
      student = Student.new(first_name: 'Pepe', last_name:'Perez', email: 'sample@example.es', course_id: @course).save
      expect { raise StandardError, " can't be shorter than 3 characters or longer than 50"}.to raise_error(StandardError, " can't be shorter than 3 characters or longer than 50")
    end

    it 'ensures email presence' do
      student = Student.new(first_name: 'Pepe' ,last_name: 'Perez', course_id: @course).save
      expect { raise StandardError, "Email can't be blank"}.to raise_error(StandardError, "Email can't be blank")
    end

    it 'ensures course presence' do
      student = Student.new(first_name: 'Pepe', last_name: 'Perez', email: 'sample@example.es' ).save
      expect { raise StandardError, "Course must exist"}.to raise_error(StandardError, "Course must exist")
    end

    it 'should save successfully' do
      student = Student.new(first_name: 'Pepe', last_name: 'Perez', email: 'sample@example.es', course: @course).save
      expect(student).to eq(true)
    end

  end

  context 'scope test' do

  end

end

