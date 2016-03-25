class UpdatesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @update =  Update.new
  end

  def create
    @features = []
    @project = Project.find(params[:project_id])
    @updates = @project.updates.order(created_at: :asc)
    @update = Update.new(update_params)
    @update.project = @project

    if @update.save
      flash[:notice] = 'Activity successfully added!'
      redirect_to project_path(@project)
    else
      flash[:alert] = "Activity was not saved. #{@update.errors.full_messages.join ", "}."
      render :'updates/new'
    end
  end

  private

  def update_params
    params.require(:update).permit(:body).merge(project: Project.find(params[:project_id]))
  end
end
