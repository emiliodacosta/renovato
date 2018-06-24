class ProjectsController < ApplicationController
  def match
    puts params[:limit]
    puts
    puts
    puts
    @project = Project.find(params[:id])
    validContractors = @project.match
    @project.contractors = validContractors
    redirect_to root_path
  end
end