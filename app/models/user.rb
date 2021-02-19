class User < ApplicationRecord
    include BCrypt
    validates :email, :username, uniqueness: true
    has_secure_password
    has_many :videos 
    has_many :comments
    has_many :subs_relationships, foreign_key: :sub_id, class_name: 'Subscription'
    has_many :subs, through: :subs_relationships, source: :follower

    has_many :subscription_relationships, foreign_key: :user_id, class_name: "Subscription"
    has_many :subscriptions, through: :subscription_relationships, source: :following
    has_many :video_likes
    attribute :subCount
end
