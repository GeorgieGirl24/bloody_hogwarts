require 'rails_helper'

RSpec.describe 'Course Index' do
  describe 'As a visitor' do
    describe 'when you are on the courses ' do
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
        @student_3 = Student.create!(
          name: 'Hermonie',
          age: '12',
          house: 'Hogwarts'
        )
        @course_1 = Course.create!(
          name: 'Witchery'
        )
        @course_2 = Course.create!(
          name: 'Sorcery'
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
        StudentCourse.create!(
          student: @student_2,
          course: @course_1
        )
        StudentCourse.create!(
          student: @student_3,
          course: @course_1
        )
      end
      it 'can see a list of courses and the number of students enrolled in each course' do
        visit '/courses'

        expect(page).to have_content('Witchery: 3')
        expect(page).to have_content('Sorcery: 2')
        expect(page).to have_content('Herbology: 1')
      end
    end
  end
end
