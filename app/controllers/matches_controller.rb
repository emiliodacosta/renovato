class MatchesController < ApplicationController

  def add
    @project = Project.find(params[:project_id])
    @contractor = Contractor.find(params[:contractor_id])

    @project.matches << @contractor

    @match = Match.new(params[:match])
    if @match.save
      redirect_to root_path
    else
      flash.now[:errors] = @match.errors.full_messages
    end
  end
end