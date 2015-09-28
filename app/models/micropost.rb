class Micropost < ActiveRecord::Base
  belongs_to :user #それぞれの投稿は特定の1人のユーザーのものである
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true #user_idが存在する
  validates :content, presence: true, length: { maximum: 140 } #contentが存在し、また、文字数は最大140。
  #validates :image, presence: true
end
