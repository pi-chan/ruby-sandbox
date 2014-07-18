class Item < ActiveRecord::Base
  mount_uploader :image, ItemUploader
end
