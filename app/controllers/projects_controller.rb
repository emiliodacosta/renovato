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
    project.contractors.each do |matchedContractor|
      match = Match.where("project_id = #{project.id} AND contractor_id = #{matchedContractor.id}")
      # I am storing 2 API keys in the comments that I have been alternating between when I end up exceeded the rate limit during testing
      #B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ
      #tqxIbLK3jw98wuh8RfpFEkju7iZGizw2OjPQb5mqQG1jhPu7NbKi1djiL5NjsoKj
      data = open("http://www.zipcodeapi.com/rest/B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ/distance.json/#{project.zipCode}/#{matchedContractor.zipCode}/miles").read
      parsed = JSON.parse(data)
      three_decimal_distance = parsed['distance']
      match.update(distance: three_decimal_distance)
    end
    redirect_to root_path
  end
end
