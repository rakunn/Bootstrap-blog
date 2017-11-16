class Asset < ApplicationRecord
  belongs_to :article
  has_attached_file :image, :styles => { :small => "150x150>", :large => "320x240>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
