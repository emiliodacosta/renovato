# frozen_string_literal: true

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

  # def match(limit = 1)
  #   where_clause = {}
  #   where_clause[:intSvcs] = true if intSvcs
  #   where_clause[:archSvcs] = true if archSvcs
  #   where_clause[:gcSvcs] = true if gcSvcs
  #   arr = Contractor.where(where_clause)
  #   arr[0...limit]
  # end

  def match(limit = 1)
    where_clause = {}
    if self.intSvcs
      where_clause[:intSvcs] = true
    end
    if self.archSvcs
      where_clause[:archSvcs] = true
    end
    if self.gcSvcs
      where_clause[:gcSvcs] = true
    end
    arr = Contractor.where(where_clause)
    return arr[0...limit]
  end
end
