# frozen_string_literal: true

class ProjectsController < ApplicationController
  def match
    puts params[:limit]
    puts
    puts
    puts
    @project = Project.find(params[:id])
    validContractors = if params[:limit]
                         @project.match(params[:limit].to_i)
                       else
                         @project.match
                       end
    @project.contractors = validContractors
    redirect_to root_path
  end
end
