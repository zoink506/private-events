class EnrollmentsController < ApplicationController
  before_action :require_login

  def create
    p "current user id: #{current_user.id}"
  end

  private
  def enrollment_params
    
  end
end
