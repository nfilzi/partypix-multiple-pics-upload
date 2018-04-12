class Picture < ApplicationRecord
  belongs_to :room

  mount_uploader :photo, PhotoUploader
end
