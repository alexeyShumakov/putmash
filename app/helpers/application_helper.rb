module ApplicationHelper
  def custom_currency(price)
    number_to_currency(price, unit: "", separator: ",", delimiter: " ")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
