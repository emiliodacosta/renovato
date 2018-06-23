class Match < ApplicationRecord
  belongs_to :project,
  primary_key: :id,
  foreign_key: :project_id,
  class_name: 'Project'

  belongs_to :contractor,
  primary_key: :id,
  foreign_key: :contractor_id,
  class_name: 'Contractor'
end
