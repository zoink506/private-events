class EnrollmentsController < ApplicationController
  before_action :require_login

  def create
    # TO DO
    #   - Check if the current user posted the event before being allowed to enrol in it
    @enrollment = Enrollment.new(user_id: current_user.id, event_id: params[:event_id])

    # check the current user's enrollments to see if they have previously enrolled for this specific event
    enr_find = current_user.enrollments.any? do |enr|
      enr.event_id == params[:event_id].to_i
    end

    # if the user has not previously enrolled with this event, proceed with saving the enrollment
    if !enr_find
      if @enrollment.save
        flash[:notice] = "Congratulations, you are now attending this event!"
      else
        flash[:alert] = "Sorry! Something went wrong while finalizing your attendance, please try again later"
      end
    else
      # If the user has previously enrolled in this event, redirect them back the the event page with an error message
      flash[:notice] = "You have already enrolled in this event!"
    end

    redirect_to event_path(params[:event_id])
  end

  private
  def enrollment_params
    
  end
end
