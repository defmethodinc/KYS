class Tool < ApplicationRecord
  has_many :experiences
  has_many :confidence_levels
end
