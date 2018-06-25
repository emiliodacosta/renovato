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
    puts
    puts
    data = open("http://www.zipcodeapi.com/rest/B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ/distance.json/#{projectZip}/11385/miles").read
    parsed = JSON.parse(data)
    three_decimal_distance = parsed["distance"]
    distance = three_decimal_distance.round(1)
    puts distance
    puts
    puts

    where_clause = {}
    where_clause[:intSvcs] = true if intSvcs
    where_clause[:archSvcs] = true if archSvcs
    where_clause[:gcSvcs] = true if gcSvcs
    arr = Contractor.where(where_clause)
    hash = {}
    arr.each do |contractor|
      data = open("http://www.zipcodeapi.com/rest/B2HfrUb5mG1V8YHxz1gB4PhuWTTxZvo0xY3A9BAd0e0hJdJ3onNT5cNERhGuBVRJ/distance.json/#{projectZip}/#{contractor.zipCode}/miles").read
      parsed = JSON.parse(data)
      three_decimal_distance = parsed["distance"]
      hash[contractor] = three_decimal_distance
    end
    sort_hash = hash.sort_by(&:last)
    puts
    puts hash
    puts
    puts sort_hash
    puts
    result = []
    sort_hash.each_with_index do |contractor, i|
      result << sort_hash[i][0]
    end
    puts
    puts result
    puts
    result[0...limit]
  end



  # def match(limit = 1)
  #   where_clause = {}
  #   if self.intSvcs
  #     where_clause[:intSvcs] = true
  #   end
  #   if self.archSvcs
  #     where_clause[:archSvcs] = true
  #   end
  #   if self.gcSvcs
  #     where_clause[:gcSvcs] = true
  #   end
  #   arr = Contractor.where(where_clause)
  #   return arr[0...limit]
  # end
end
