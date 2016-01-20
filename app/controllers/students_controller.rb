class StudentsController < ApplicationController
  before_action :set_student, only: [ :edit, :update, :show, :destroy ]

  def index
    @students = Student.all.decorate
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, flash: { success: 'Curso apgado com sucesso' }
  end

  private

    def set_student
      @student = Student.find_by_id(params[:id])
      redirect_to students_path unless @student
    end

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
end
