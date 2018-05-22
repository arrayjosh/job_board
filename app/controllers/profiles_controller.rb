class ProfilesController < ApplicationController
  def index
    @profiles = User.page(params[:page])
  end

  def show
    @profile = User.find(params[:id])
    @jobs = @profile.jobs.page(params[:page])
  end
end
