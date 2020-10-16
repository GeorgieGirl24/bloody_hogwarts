require 'rails_helper'

RSpec.describe 'Students Index' do
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
    end
    describe 'when I visit  the students index page' do
      it 'can see a list of the students information' do
        visit '/students'

        # within "#{@student_1.id}-block" do
          expect(page).to have_content(@student_1.name)
          expect(page).to have_content(@student_1.age)
          expect(page).to have_content(@student_1.house)
        # end

        # within "#student #{@student_2.id}" do
          expect(page).to have_content(@student_2.name)
          expect(page).to have_content(@student_2.age)
          expect(page).to have_content(@student_2.house)
        # end
      end
    end
  end
end
