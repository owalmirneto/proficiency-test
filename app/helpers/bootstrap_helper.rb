module BootstrapHelper
  def flash_message
    output = ''
    [:success, :info, :warning, :error, :notice, :alert].each do |type|
      if flash[type]
        class_name = type
        class_name = :danger if type == :error
        class_name = :info if type == :alert || type == :notice

        output += bs_alert(class_name, flash[type], type)
      end
    end

    output.html_safe
  end

  def bs_modal_confirm_destroy id, url, title='Atenção!', message='Você deseja realmente remover?'
    render 'shared/bootstrap/modal_confirm_destroy', id: id, url: url, title: title, message: message
  end

  def bs_alert type, message, subtitle=nil
    render 'shared/bootstrap/alert', type: type, message: message, subtitle: subtitle
  end
end
