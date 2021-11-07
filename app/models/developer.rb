class Developer < ApplicationRecord

  ROLES = ['frontend dev', 'backend dev'].freeze

  validates_presence_of :name, :role
end
