class Upload < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  # class_methods do
  #   def upload_count
  #     # uploads.where(user.id=current_user)count
  #     (current_user).uploads.count
  #   end
  # end
end
