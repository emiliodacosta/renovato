class Renovator < ApplicationRecord
  has_many :projects,
  primary_key: :id,
  foreign_key: :renovator_id,
  class_name: 'Project'
end
