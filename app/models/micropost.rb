class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :fav_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2200 }
  validate :picture_size

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MB以上のサイズはアップロードできません")
    end
  end

  def fav(user)
    likes.create(user_id: user.id)
  end

  def unfav(user)
    likes.find_by(user_id: user.id).destroy
  end

  def fav?(user)
    fav_users.include?(user)
  end

end