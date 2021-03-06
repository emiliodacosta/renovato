# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.all
    @contractors = Contractor.all
    @matches = Match.all
    render :index
  end
end
