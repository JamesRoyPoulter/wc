class EnrolmentsController < ApplicationController

  def create
    @enrolment = Enrolment.new([:user])
    if @enrolment.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end

