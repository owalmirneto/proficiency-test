class ClassroomDecorator < Draper::Decorator
  delegate_all

  def course_name
    object.course.name if object.course
  end

  def student_name
    object.student.name if object.student
  end

  def created_date
    created_format
  end

  def created_datetime
    created_format('%d/%m/%Y às %H:%M:%S')
  end

  def created_format format='%d/%m/%Y'
    object.created_at.strftime(format) if object.created_at
  end
end
