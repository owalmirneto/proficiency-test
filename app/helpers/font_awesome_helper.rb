module FontAwesomeHelper
  def fa_icon icon, options={}
    options[:class] = options[:class].present? ? "fa fa-fw fa-#{icon} #{options[:class]}" : "fa fa-fw fa-#{icon}"
    content_tag :i, nil, options
  end
end
