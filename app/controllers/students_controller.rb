class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show

    # @student = Student.find(student_params[:id])
    @student = Student.find(params[:student_id])
    # binding.pry
    # @student_courses = StudentCourse.select(:course_id).where(:student_id == 'student.id')
  end

  private
  def student_params
    binding.pry
    params.permit(:name, :age, :house, :courses)
  end
end
