class StudentsController < ApplicationController
  before_action :autentica_usuario!, except: :get_student
  before_action :set_teacher, except: :get_student
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

  def get_student
    @user = Student.where(name: params[:username]).where(password: params[:password]).first
    respond_to do |format|
      format.xml { render xml: @user }
      format.json { render json: @user }
      format.text { if @user
                      render text: 'ok'
                    else
                      render text: 'Sin acceso'
                    end
                  }
              end
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
