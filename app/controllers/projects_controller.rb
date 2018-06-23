class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :index
  end

  def show
    @project = Project.find_by(id: params[:id])
    render :show
  end
end