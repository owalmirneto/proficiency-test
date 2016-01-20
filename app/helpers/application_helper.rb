module ApplicationHelper
  def not_found_message model_name, gender = 'male'
    t("app.not_found.#{gender}", model_name: tm(model_name)).capitalize
  end

  def success_message model_name
    t("app.success", model_name: tm(model_name)).capitalize
  end
end
