class StudentDecorator < Draper::Decorator
  delegate_all

  def status_label format='%d/%m/%Y'
    class_name = if object.status_active?
      'success'
    elsif object.status_inactive?
      'danger'
    else
      'default'
    end

    h.content_tag :span, object.status_humanize, class: "label label-#{class_name}"
  end
end
