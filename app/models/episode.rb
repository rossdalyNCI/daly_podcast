class Episode < ApplicationRecord
  belongs_to :podcast #rails migration auto creates an association
  
  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" } # needed for paperlcip image uploading
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/
  
  has_attached_file :mp3 # needed for mp3 uploading
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"]}, :file_name => { :matches => [/mp3\Z/]} # validates the attachment and makes sure the file matches .mp3
end
