class ClassroomDecorator < Draper::Decorator
  delegate_all

  def status_label format='%d/%m/%Y'
    class_name = if object.status_wait?
      'info'
    elsif object.status_open?
      'success'
    elsif object.status_closed?
      'danger'
    else
      'default'
    end

    h.content_tag :span, object.status_humanize, class: "label label-#{class_name}"
  end
end
