module EnumarateItHelper
  def enumaration_to_options enumaration
    enumaration.to_a.map { |enum| enum }
  end
end
