class EnrollmentsController < ApplicationController
  before_action :require_login

  def create
    @enrollment = Enrollment.new(user_id: current_user.id, event_id: params[:event_id])
    p @enrollment

    if @enrollment.save
      flash[:notice] = "Congratulations, you are now attending this event!"
    else
      flash[:alert] = "Sorry! Something went wrong while finalizing your attendance, please try again later"
    end

    redirect_to event_path(params[:event_id])
  end

  private
  def enrollment_params
    
  end
end
