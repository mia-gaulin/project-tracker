class FeaturesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @feature =  Feature.new
  end

  def create
    @updates = []
    @project = Project.find(params[:project_id])
    @features = @project.features.order(created_at: :asc)
    @feature = Feature.new(feature_params)
    @feature.project = @project

    if @feature.save
      flash[:notice] = 'Feature successfully added!'
      redirect_to project_path(@project)
    else
      flash[:alert] = "Feature was not saved. #{@feature.errors.full_messages.join ", "}."
      render :'features/new'
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:body).merge(project: Project.find(params[:project_id]))
  end
end
