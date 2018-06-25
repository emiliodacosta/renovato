# frozen_string_literal: true

class Contractor < ApplicationRecord
  has_many :matches,
           primary_key: :id,
           foreign_key: :contractor_id,
           class_name: 'Match'

  has_many :projects,
           through: :matches,
           source: :project
end
