class Project < ApplicationRecord
  belongs_to :renovator,
  primary_key: :id,
  foreign_key: :renovator_id,
  class_name: 'Renovator'

  has_many :matches,
  primary_key: :id,
  foreign_key: :project_id,
  class_name: 'Match'
end
