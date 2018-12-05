class Episode < ApplicationRecord
  belongs_to :podcast #rails migration auto creates an association
end
