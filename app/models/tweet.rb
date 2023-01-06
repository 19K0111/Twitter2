class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :users, :through => :likes
    has_many :dislikes, dependent: :destroy
    has_many :users, :through => :dislikes
end
