class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower

  attachment :profile_image

def follow(customer_id)
 follower.create(followed_id: customer_id)
end
# ユーザーのフォローを外す
def unfollow(customer_id)
 follower.find_by(followed_id: customer_id).destroy
end
# フォロー確認をおこなう
def following?(customer)
 following_customer.include?(customer)
end

def self.customers_search(keyword)
  where(["name like?", "%#{keyword}%"])
end

end
