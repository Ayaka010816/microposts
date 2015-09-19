class User < ActiveRecord::Base
    before_save { self.email = email.downcase } #コールバック
  validates :name, presence: true, length: { maximum: 50 } #空でなく、また、最大50文字
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #空でなく、また、最大255文字
  validates :location, length: { maximum: 255 }
  validates :biography, length: { maximum: 255 }#空でなく、また、最大255文字
                    
  has_secure_password
  has_many :microposts  #それぞれのユーザーは複数の投稿を持つことができる。
end
