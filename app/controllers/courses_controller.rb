class CoursesController < ApplicationController
  before_action :set_course, only: [ :edit, :update, :show, :destroy ]

  def index
    @courses = Course.all.decorate
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, flash: { success: 'Curso salvo com sucesso' }
    else
      render :edit
    end
  end

  private

    def set_course
      @course = Course.find_by_id(params[:id])
      redirect_to courses_path unless @course
    end

    def course_params
      params.require(:course).permit(:name, :status, :description)
    end
end