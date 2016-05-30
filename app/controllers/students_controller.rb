class StudentsController < ApplicationController
  before_action :autentica_usuario!
  before_action :set_teacher
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = @teacher.students
  end

  def new
    @teacher = User.find(params[:user_id])
    @student = @teacher.students.new
  end

  def create
    @student = @teacher.students.new(students_params)
    if @student.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @student.destroy

    redirect_to user_path @teacher
  end

private

  def students_params
    params.require(:student).permit(:name, :age, :password)
  end

  def set_student
    @studen = @teacher.students.find(params[:id])
  end

  def set_teacher
    @teacher = User.find(params[:user_id])
  end

end
