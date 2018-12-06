class Episode < ApplicationRecord
  belongs_to :podcast #rails migration auto creates an association
  
  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" } # needed for paperlcip image uploading
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/
end
