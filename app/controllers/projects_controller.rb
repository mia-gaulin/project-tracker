class ProjectsController < ApplicationController
  def index
    @projects = Project.order(updated_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @features = @project.features.order(updated_at: :desc)
    @feature = Feature.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project added!"
      redirect_to projects_path
    else
      flash[:alert] = "Please make sure all fields are filled in!"
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :description
    )
  end
end
