class HomeController < ApplicationController
  def index
    @courses = Course.limit(5).order(created_at: :desc).decorate
    @classrooms = Classroom.limit(5).order(created_at: :desc).decorate
  end
end
