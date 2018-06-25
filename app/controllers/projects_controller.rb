# frozen_string_literal: true

class ProjectsController < ApplicationController
  def match
    project = Project.find(params[:id])
    zip = project.zipCode
    valid_sorted_contractors = if params[:limit]
                         project.match(zip, params[:limit].to_i)
                       else
                         project.match(zip)
                       end
    project.contractors = valid_sorted_contractors
    redirect_to root_path
  end
end
