# frozen_string_literal: true
require 'open-uri'

class Project < ApplicationRecord
  belongs_to :renovator,
             primary_key: :id,
             foreign_key: :renovator_id,
             class_name: 'Renovator'

  has_many :matches,
           primary_key: :id,
           foreign_key: :project_id,
           class_name: 'Match'

  has_many :contractors,
           through: :matches,
           source: :contractor

  def match(projectZip, limit = 1)
    where_clause = {}
    where_clause[:intSvcs] = true if intSvcs
    where_clause[:archSvcs] = true if archSvcs
    where_clause[:gcSvcs] = true if gcSvcs
    valid_arr = Contractor.where(where_clause)
    valid_w_distance_arr = []
    valid_arr.each do |contractor|
      # I am storing 2 API keys in the comments that I have been alternating between when I end up exceeded the rate limit during testing
      #B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ
      #tqxIbLK3jw98wuh8RfpFEkju7iZGizw2OjPQb5mqQG1jhPu7NbKi1djiL5NjsoKj
      data = open("http://www.zipcodeapi.com/rest/B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ/distance.json/#{projectZip}/#{contractor.zipCode}/miles").read
      parsed = JSON.parse(data)
      three_decimal_distance = parsed["distance"]
      valid_w_distance_arr << [three_decimal_distance, contractor]
    end
    valid_w_distance_arr.sort!
    result_arr = []
    valid_w_distance_arr.each do |ele|
      result_arr << ele[1]
    end
    result_arr[0...limit]
  end
end
