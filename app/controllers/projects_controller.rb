class ProjectsController < ApplicationController
  def index
    @projects = Project.order(updated_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @features = @project.features.order(updated_at: :desc)
    @feature = Feature.new
    @updates = @project.updates.order(updated_at: :desc)
    @update = Update.new
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

  def destroy
    @project = Project.find(params[:id])
    @features = @project.features
    @updates = @project.updates

    if @project.destroy!
      @features.map { |feature| feature.destroy! }
      @updates.map { |update| update.destroy! }

      flash[:notice] = "Project deleted!"
    end
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :github_link
    )
  end
end
