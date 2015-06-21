class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	include CurrentCart
	before_action :set_cart
	layout :layout_by_resource
  protect_from_forgery with: :exception
  before_filter :set_currency
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) << [:name, :surname,
			                                             :organization, :position,
			                                             :birth_date, :gender ]
			devise_parameter_sanitizer.for(:account_update) << [:name, :surname,
			                                             :organization, :position,
			                                             :birth_date, :gender ]
		end

		def layout_by_resource
			if devise_controller?
				"devise"
			else
				"application"
			end
		end

		def set_currency
      @currency = CurrencyValue.last(2)
    end
end
