class ClassroomsController < ApplicationController
  before_action :set_depence_for_form, only: [ :new, :create, :edit, :update ]
  before_action :set_classroom, only: [ :edit, :update, :show, :destroy ]

  def index
    @classrooms = Classroom.all.decorate
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to classrooms_path, flash: { success: 'Matricula salva com sucesso' }
    else
      render :new
    end
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_path, flash: { success: 'Matricula cancelada com sucesso' }
  end

  private

    def set_depence_for_form
      @students = Student.all
      @courses = Course.all
    end

    def set_classroom
      @classroom = Classroom.find_by_id(params[:id])
      redirect_to classrooms_path unless @classroom
    end

    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end
end
