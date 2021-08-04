class Character < ApplicationRecord
  belongs_to :user
  validates :image_url, format: {
    with: /\A(https?:\/\/.+\..+\/.+\.((jpe?|pn|sv)g|webp))?\z/i,
    message: "must be a link to a still image"
  }
end
