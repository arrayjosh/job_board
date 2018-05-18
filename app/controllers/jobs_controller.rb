class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy, :show]
  has_scope :search

  def index
    @jobs = apply_scopes(Job).page(params[:page])
  end

  def show

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

  def edit
    # debugger
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end


  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description)
    end
end
