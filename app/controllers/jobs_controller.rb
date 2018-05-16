class JobsController < ApplicationController

  def index

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.title = params[:job][:title]
    # @job.description = params[:job][:description]

    if @job.save
      redirect_to jobs_path
    else
      # debugger
      flash.now[:notice] = "There's problems with your new job form"
      render 'new'
    end
    # debugger # this is a breakpoint, the server will stop when it hits this, and let us debug
  end

  private
    def job_params
      params.require(:job).permit(:title, :description)
    end
end
