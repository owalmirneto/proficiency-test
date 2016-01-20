class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [ :edit, :update, :show, :destroy ]

  def index
    @classrooms = Classroom.all.decorate
  end

  def new
    @students = Student.all
    @courses = Course.all
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to classrooms_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to classrooms_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :edit
    end
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_path, flash: { success: 'Curso apgado com sucesso' }
  end

  private

    def set_classroom
      @classroom = Classroom.find_by_id(params[:id])
      redirect_to classrooms_path unless @classroom
    end

    def classroom_params
      params.require(:classroom).permit(:name, :status, :description)
    end
end
