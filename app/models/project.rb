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
  end

end
