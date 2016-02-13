class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.page params[:page]
    authorize! :index, Project

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    authorize! :show, @project

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    authorize! :new, Project

    @project = Project.new
  end

def create
  @project = Project.new(project_params)
  authorize! :create, @project

  respond_to do |format|
    if @project.save
      format.html { redirect_to @project, notice: 'Projcet was successfully created.' }
      format.json { render json: @projcet, status: :created }
    else
      format.html { render action: 'new' }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end




private

def set_project
  @project = Project.find(params[:id])
end

#add some params to trust here
def project_params
  params.require(:project).permit(:project_name, :box_number, :wire_number, :start_foot, :end_foot, :pulled_length, :jack_lock, :qty_used, :item_id, :type_ids => [])
end
end
