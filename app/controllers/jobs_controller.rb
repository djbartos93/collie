class JobsController < ApplicationController
  def index
    @jobs = Job.all.page params[:page]
    authorize! :index, Job

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end
  def new
    authorize! :new, Job

    @job = Job.new
  end
end

private

def set_job
  @job = Job.find(params[:id])
end

#add some params to trust here
