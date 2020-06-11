class Experience < ApplicationRecord
  belongs_to :member
  belongs_to :tool
  belongs_to :client
end
