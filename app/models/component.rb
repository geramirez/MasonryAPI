class Component < ApplicationRecord
  has_many :references
  has_and_belongs_to_many :verifications
end
