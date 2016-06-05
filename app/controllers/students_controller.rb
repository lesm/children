class StudentsController < ApplicationController
  before_action :autentica_usuario!, except: :get_student
  before_action :set_teacher, except: :get_student
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = @teacher.students
  end

  def show
  end

  def new
    @teacher = User.find(params[:user_id])
    @student = @teacher.students.new
  end

  def create
    @student = @teacher.students.new(student_params)
    if @student.save
      redirect_to root_path, notice: 'El alumno fue creado exitosamente.'
    else
      render 'new'
    end
  end

  def edit_password
    @student = @teacher.students.find(params[:student_id])
  end

  def update
    if @student.update(student_params)
      redirect_to user_student_path(@teacher, @student), notice: 'El alumno fue actualizado correctamente'
    else
      if params[:student].count == 2
        render 'edit_password'
      else
        render 'edit'
      end
    end  
  end

  def destroy
    @student.destroy

    redirect_to user_students_path @teacher, notice: 'El alumno fue aliminado exitosamente'
  end

  def get_student
    @user = Student.where(username: params[:username]).first
    respond_to do |format|
      format.xml { render xml: @user }
      format.json { render json: @user }
      format.text { if @user
                      render text: 'OK'
                    else
                      render text: 'SIN ACCESO'
                    end
                  }
              end
  end

private

  def student_params
    params.require(:student).permit(:name, :birthdate, :password, :avatar, :username, :password_confirmation)
  end

  def set_student
    @student = @teacher.students.find(params[:id])
  end

  def set_teacher
    @teacher = User.find(params[:user_id])
  end

end
