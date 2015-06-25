class UsersController < ApplicationController
  before_action :authenticate_user!
  def private_office
  end

  def orders

  end
end
