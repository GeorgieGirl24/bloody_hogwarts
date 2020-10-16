require 'rails_helper'

RSpec.describe 'Students Show Page' do
  describe 'As a visitor' do
    before :each do

      @student_1 = Student.create!(
        name: 'Casseopia Black',
        age: '14',
        house: 'Slytherin'
      )
      @student_2 = Student.create!(
        name: 'Harry Potter',
        age: '14',
        house: 'Hogwarts'
      )

      @course_1 = Course.create!(
        name: 'Witchery'
      )
      @course_2 = Course.create!(
        name: 'Scorcery'
      )
      @course_3 = Course.create!(
        name: 'Herbology'
      )

      StudentCourse.create!(
        student: @student_1,
        course: @course_1
      )
      StudentCourse.create!(
        student: @student_1,
        course: @course_3
      )
      StudentCourse.create!(
        student: @student_1,
        course: @course_2
      )
      StudentCourse.create!(
        student: @student_2,
        course: @course_2
      )
    end
    it 'can see a list of the students cources' do
      visit "/students/#{@student_1.id}"

      expect(page).to have_content(@student_1.name)

      expect(page).to have_content("All of Students's Courses")
      expect(page).to have_content(@course_1.name)
      expect(page).to have_content(@course_3.name)
      expect(page).to have_content(@course_2.name)
    end
  end
end
