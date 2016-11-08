class Component < ApplicationRecord
  has_many :references
  has_many :satisfies
  has_and_belongs_to_many :verifications
end
