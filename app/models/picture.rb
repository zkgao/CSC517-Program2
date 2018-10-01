class Picture < ApplicationRecord
  mount_uploader :picture_url, AvatarUploader
end
